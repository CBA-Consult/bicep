// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.
using System.Diagnostics.CodeAnalysis;
using System.Text;
using Bicep.Core.Diagnostics;
using Bicep.Core.FileSystem;
using Bicep.Core.Parsing;
using Bicep.Core.UnitTests.Utils;
using FluentAssertions;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using LocalFileSystem = System.IO.Abstractions.FileSystem;

namespace Bicep.Core.UnitTests.FileSystem
{
    [TestClass]
    public class FileResolverTests
    {
        [NotNull]
        public TestContext? TestContext { get; set; }

        private static IFileResolver GetFileResolver()
            => new FileResolver(new LocalFileSystem());

        [DataTestMethod]
        [DynamicData(nameof(TryResolveModulePathData), DynamicDataSourceType.Method)]
        public void TryResolveModulePath_should_return_expected_results(string parentFilePath, string childFilePath, string? expectedResult)
        {
            var fileResolver = GetFileResolver();
            fileResolver.TryResolveFilePath(new Uri(parentFilePath), childFilePath).Should().Be(expectedResult != null ? new Uri(expectedResult) : null, $"{nameof(fileResolver.TryResolveFilePath)}(\"{parentFilePath}\", \"{childFilePath}\") should produce expected result");
        }

        private static IEnumerable<object?[]> TryResolveModulePathData()
        {
            if (CompilerFlags.IsWindowsBuild)
            {
                yield return new[] { "file:///C:/abc/file.bicep", "def/ghi.bicep", "file:///C:/abc/def/ghi.bicep", };
                yield return new[] { "file:///C:/abc/file.bicep", "./def/ghi.bicep", "file:///C:/abc/def/ghi.bicep", };
                yield return new[] { "file:///C:/abc/file.bicep", "../ghi.bicep", "file:///C:/ghi.bicep", }; // directory is resolved relative to parent path
                yield return new[] { "file:///C:/abc/file.bicep", "./def/../ghi.bicep", "file:///C:/abc/ghi.bicep", }; // directory is resolved
                yield return new[] { "file:///D:/abc/file.bicep", "/def.bicep", "file:///D:/def.bicep", }; // root child path is used as-is
                yield return new[] { "file:///E:/abc/file.bicep", "/abc/../def/../ghi.bicep", "file:///E:/ghi.bicep", }; // root child path is used as-is with normalization
            }
            else
            {
                yield return new[] { "file:///abc/file.bicep", "def/ghi.bicep", "file:///abc/def/ghi.bicep", };
                yield return new[] { "file:///abc/file.bicep", "./def/ghi.bicep", "file:///abc/def/ghi.bicep", };
                yield return new[] { "file:///abc/file.bicep", "../ghi.bicep", "file:///ghi.bicep", }; // directory is resolved relative to parent path
                yield return new[] { "file:///abc/file.bicep", "./def/../ghi.bicep", "file:///abc/ghi.bicep", }; // directory is resolved
                yield return new[] { "file:///abc/file.bicep", "/def.bicep", "file:///def.bicep", }; // root child path is used as-is
                yield return new[] { "file:///abc/file.bicep", "/abc/../def/../ghi.bicep", "file:///ghi.bicep", }; // root child path is used as-is with normalization
            }
        }

        [TestMethod]
        public void TryRead_should_return_expected_results()
        {
            var fileResolver = GetFileResolver();
            var tempFile = Path.Combine(Path.GetTempPath(), $"BICEP_TEST_{Guid.NewGuid()}");
            var tempFileUri = PathHelper.FilePathToFileUrl(tempFile);

            File.WriteAllText(tempFile, "abcd\r\ndef");
            fileResolver.TryRead(tempFileUri).IsSuccess(out var fileContents, out var failureMessage).Should().BeTrue();
            fileContents.Should().Be("abcd\r\ndef");
            failureMessage.Should().BeNull();

            File.Delete(tempFile);

            fileResolver.TryRead(tempFileUri).IsSuccess(out fileContents, out failureMessage).Should().BeFalse();
            fileContents.Should().BeNull();
            failureMessage.Should().NotBeNull();
        }

        [TestMethod]
        public void TryReadAsBinaryData_should_return_expected_results()
        {
            var fileResolver = GetFileResolver();
            var tempFile = Path.Combine(Path.GetTempPath(), $"BICEP_TEST_{Guid.NewGuid()}");
            var tempFileUri = PathHelper.FilePathToFileUrl(tempFile);

            File.WriteAllText(tempFile, "abcd\r\ndef\r\n\r\nghi");
            fileResolver.TryReadAsBinaryData(tempFileUri).IsSuccess(out var fileContents, out var failureMessage).Should().BeTrue();
            Convert.ToBase64String(fileContents, Base64FormattingOptions.None).Should().Be("YWJjZA0KZGVmDQoNCmdoaQ==");
            failureMessage.Should().BeNull();

            fileResolver.TryReadAsBinaryData(tempFileUri, 6).IsSuccess(out fileContents, out failureMessage).Should().BeFalse();
            fileContents.Should().BeNull();
            failureMessage.Should().NotBeNull();
            Core.Diagnostics.DiagnosticBuilder.DiagnosticBuilderInternal diag = new(new Core.Parsing.TextSpan(0, 5));
            var err = failureMessage!.Invoke(diag);
            err.Message.Should().Contain($"6 bytes");

            File.Delete(tempFile);

            fileResolver.TryReadAsBinaryData(tempFileUri).IsSuccess(out fileContents, out failureMessage).Should().BeFalse();
            fileContents.Should().BeNull();
            failureMessage.Should().NotBeNull();
        }

        [TestMethod]
        [ExpectedException(typeof(IOException), AllowDerivedTypes = true)]
        public void GetDirectories_should_return_expected_results()
        {
            var fileResolver = GetFileResolver();
            var tempDir = Path.Combine(Path.GetTempPath(), $"BICEP_TESTDIR_{Guid.NewGuid()}");
            var tempFile = Path.Combine(tempDir, $"BICEP_TEST_{Guid.NewGuid()}");
            var tempChildDir = Path.Combine(tempDir, $"BICEP_TESTCHILDDIR_{Guid.NewGuid()}");

            // make parent dir
            Directory.CreateDirectory(tempDir);
            fileResolver.GetDirectories(PathHelper.FilePathToFileUrl(tempDir)).Should().HaveCount(0);
            // make child dir
            Directory.CreateDirectory(tempChildDir);
            fileResolver.GetDirectories(PathHelper.FilePathToFileUrl(tempDir)).Should().HaveCount(1);
            // add a file to parent dir
            File.WriteAllText(tempFile, "abcd\r\ndef");
            fileResolver.GetDirectories(PathHelper.FilePathToFileUrl(tempDir)).Should().HaveCount(1);
            // check child dir
            fileResolver.GetDirectories(PathHelper.FilePathToFileUrl(tempChildDir)).Should().HaveCount(0);
            // should throw an IOException when called with a file path
            fileResolver.GetDirectories(PathHelper.FilePathToFileUrl(Path.Join(Path.GetTempPath(), tempFile)));
        }

        [TestMethod]
        [ExpectedException(typeof(IOException), AllowDerivedTypes = true)]
        public void GetFiles_should_return_expected_results()
        {
            var fileResolver = GetFileResolver();
            var tempDir = Path.Combine(Path.GetTempPath(), $"BICEP_TESTDIR_{Guid.NewGuid()}");
            var tempFile = Path.Combine(tempDir, $"BICEP_TEST_{Guid.NewGuid()}");
            var tempChildDir = Path.Combine(tempDir, $"BICEP_TESTCHILDDIR_{Guid.NewGuid()}");

            // make parent dir
            Directory.CreateDirectory(tempDir);
            fileResolver.GetFiles(PathHelper.FilePathToFileUrl(tempDir)).Should().HaveCount(0);
            // add a file to parent dir
            File.WriteAllText(tempFile, "abcd\r\ndef");
            fileResolver.GetFiles(PathHelper.FilePathToFileUrl(tempDir)).Should().HaveCount(1);
            // make child dir
            Directory.CreateDirectory(tempChildDir);
            fileResolver.GetFiles(PathHelper.FilePathToFileUrl(tempDir)).Should().HaveCount(1);
            // check child dir
            fileResolver.GetFiles(PathHelper.FilePathToFileUrl(tempChildDir)).Should().HaveCount(0);
            // should throw an IOException when called with a file path
            fileResolver.GetDirectories(PathHelper.FilePathToFileUrl(Path.Join(Path.GetTempPath(), tempFile)));
        }

        [TestMethod]
        public void DirExists_should_return_expected_results()
        {
            var fileResolver = GetFileResolver();
            var tempDir = Path.Combine(Path.GetTempPath(), $"BICEP_TESTDIR_{Guid.NewGuid()}");
            var tempFile = Path.Combine(tempDir, $"BICEP_TEST_{Guid.NewGuid()}");
            var tempChildDir = Path.Combine(tempDir, $"BICEP_TESTCHILDDIR_{Guid.NewGuid()}");

            // make parent dir
            Directory.CreateDirectory(tempDir);
            fileResolver.DirExists(PathHelper.FilePathToFileUrl(tempDir)).Should().BeTrue();
            fileResolver.DirExists(PathHelper.FilePathToFileUrl(tempFile)).Should().BeFalse();
            // add a file to parent dir
            File.WriteAllText(tempFile, "abcd\r\ndef");
            fileResolver.DirExists(PathHelper.FilePathToFileUrl(tempDir)).Should().BeTrue();
            fileResolver.DirExists(PathHelper.FilePathToFileUrl(tempFile)).Should().BeFalse();
            // make child dir
            Directory.CreateDirectory(tempChildDir);
            fileResolver.DirExists(PathHelper.FilePathToFileUrl(tempChildDir)).Should().BeTrue();
        }

        [DataTestMethod]
        [DataRow("", 2, true, "")]
        [DataRow("a", 2, true, "a")]
        [DataRow("aa", 2, true, "aa")]
        [DataRow("aaaa\nbbbbb", 2, true, "aa")]
        public void TryReadAtMostNCharacters_RegardlessFileContentLength_ReturnsAtMostNCharacters(string fileContents, int n, bool expectedResult, string expectedContents)
        {
            var fileResolver = GetFileResolver();
            var tempFile = Path.Combine(Path.GetTempPath(), $"BICEP_TEST_{Guid.NewGuid()}");
            var tempFileUri = PathHelper.FilePathToFileUrl(tempFile);

            File.WriteAllText(tempFile, fileContents);

            var result = fileResolver.TryReadAtMostNCharacters(tempFileUri, Encoding.UTF8, n).IsSuccess(out var readContents);

            result.Should().Be(expectedResult);
            readContents.Should().Be(expectedContents);
        }


        [TestMethod]
        public void In_memory_file_resolver_should_simulate_directory_paths_correctly()
        {
            var fileTextsByUri = new Dictionary<Uri, string>
            {
                [InMemoryFileResolver.GetFileUri("/path/to/file.bicep")] = "param foo int",
                [InMemoryFileResolver.GetFileUri("/path/to/nested/file.bicep")] = "param bar int",
                [InMemoryFileResolver.GetFileUri("/path/toOther/file.bicep")] = "param foo string"
            };

            var fileResolver = new InMemoryFileResolver(fileTextsByUri);

            fileResolver.GetDirectories(InMemoryFileResolver.GetFileUri("/path"), "").Should().SatisfyRespectively(
                x => x.Should().Be(InMemoryFileResolver.GetFileUri("/path/to/")),
                x => x.Should().Be(InMemoryFileResolver.GetFileUri("/path/toOther/"))
            );

            fileResolver.GetDirectories(InMemoryFileResolver.GetFileUri("/path/to"), "").Should().SatisfyRespectively(
                x => x.Should().Be(InMemoryFileResolver.GetFileUri("/path/to/nested/"))
            );
        }

        [TestMethod]
        public void Diagnostic_should_be_raised_for_folder_instead_of_file()
        {
            var outputDir = FileHelper.GetUniqueTestOutputPath(TestContext);
            Directory.CreateDirectory(outputDir);

            var outputUri = PathHelper.FilePathToFileUrl(outputDir);
            var fileResolver = GetFileResolver();

            fileResolver.TryRead(outputUri).IsSuccess(out var fileContents, out var failureBuilder).Should().BeFalse();
            fileContents.Should().BeNull();
            var err = failureBuilder!.Invoke(new DiagnosticBuilder.DiagnosticBuilderInternal(TextSpan.TextDocumentStart));
            err.Message.Should().Match("Unable to open file at path \"*\". Found a directory instead.");
            err.Code.Should().Be("BCP275");
        }
    }
}
