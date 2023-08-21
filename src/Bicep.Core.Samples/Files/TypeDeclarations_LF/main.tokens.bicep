@description('The foo type')
//@[00:01) At |@|
//@[01:12) Identifier |description|
//@[12:13) LeftParen |(|
//@[13:27) StringComplete |'The foo type'|
//@[27:28) RightParen |)|
//@[28:29) NewLine |\n|
@sealed()
//@[00:01) At |@|
//@[01:07) Identifier |sealed|
//@[07:08) LeftParen |(|
//@[08:09) RightParen |)|
//@[09:10) NewLine |\n|
type foo = {
//@[00:04) Identifier |type|
//@[05:08) Identifier |foo|
//@[09:10) Assignment |=|
//@[11:12) LeftBrace |{|
//@[12:13) NewLine |\n|
  @minLength(3)
//@[02:03) At |@|
//@[03:12) Identifier |minLength|
//@[12:13) LeftParen |(|
//@[13:14) Integer |3|
//@[14:15) RightParen |)|
//@[15:16) NewLine |\n|
  @maxLength(10)
//@[02:03) At |@|
//@[03:12) Identifier |maxLength|
//@[12:13) LeftParen |(|
//@[13:15) Integer |10|
//@[15:16) RightParen |)|
//@[16:17) NewLine |\n|
  @description('A string property')
//@[02:03) At |@|
//@[03:14) Identifier |description|
//@[14:15) LeftParen |(|
//@[15:34) StringComplete |'A string property'|
//@[34:35) RightParen |)|
//@[35:36) NewLine |\n|
  stringProp: string
//@[02:12) Identifier |stringProp|
//@[12:13) Colon |:|
//@[14:20) Identifier |string|
//@[20:22) NewLine |\n\n|

  objectProp: {
//@[02:12) Identifier |objectProp|
//@[12:13) Colon |:|
//@[14:15) LeftBrace |{|
//@[15:16) NewLine |\n|
    @minValue(1)
//@[04:05) At |@|
//@[05:13) Identifier |minValue|
//@[13:14) LeftParen |(|
//@[14:15) Integer |1|
//@[15:16) RightParen |)|
//@[16:17) NewLine |\n|
    intProp: int
//@[04:11) Identifier |intProp|
//@[11:12) Colon |:|
//@[13:16) Identifier |int|
//@[16:18) NewLine |\n\n|

    intArrayArrayProp: int [] [] ?
//@[04:21) Identifier |intArrayArrayProp|
//@[21:22) Colon |:|
//@[23:26) Identifier |int|
//@[27:28) LeftSquare |[|
//@[28:29) RightSquare |]|
//@[30:31) LeftSquare |[|
//@[31:32) RightSquare |]|
//@[33:34) Question |?|
//@[34:35) NewLine |\n|
  }
//@[02:03) RightBrace |}|
//@[03:05) NewLine |\n\n|

  typeRefProp: bar
//@[02:13) Identifier |typeRefProp|
//@[13:14) Colon |:|
//@[15:18) Identifier |bar|
//@[18:20) NewLine |\n\n|

  literalProp: 'literal'
//@[02:13) Identifier |literalProp|
//@[13:14) Colon |:|
//@[15:24) StringComplete |'literal'|
//@[24:26) NewLine |\n\n|

  recursion: foo?
//@[02:11) Identifier |recursion|
//@[11:12) Colon |:|
//@[13:16) Identifier |foo|
//@[16:17) Question |?|
//@[17:18) NewLine |\n|
}
//@[00:01) RightBrace |}|
//@[01:03) NewLine |\n\n|

@minLength(3)
//@[00:01) At |@|
//@[01:10) Identifier |minLength|
//@[10:11) LeftParen |(|
//@[11:12) Integer |3|
//@[12:13) RightParen |)|
//@[13:14) NewLine |\n|
@description('An array of array of arrays of arrays of ints')
//@[00:01) At |@|
//@[01:12) Identifier |description|
//@[12:13) LeftParen |(|
//@[13:60) StringComplete |'An array of array of arrays of arrays of ints'|
//@[60:61) RightParen |)|
//@[61:62) NewLine |\n|
@metadata({
//@[00:01) At |@|
//@[01:09) Identifier |metadata|
//@[09:10) LeftParen |(|
//@[10:11) LeftBrace |{|
//@[11:12) NewLine |\n|
  examples: [
//@[02:10) Identifier |examples|
//@[10:11) Colon |:|
//@[12:13) LeftSquare |[|
//@[13:14) NewLine |\n|
    [[[[1]]], [[[2]]], [[[3]]]]
//@[04:05) LeftSquare |[|
//@[05:06) LeftSquare |[|
//@[06:07) LeftSquare |[|
//@[07:08) LeftSquare |[|
//@[08:09) Integer |1|
//@[09:10) RightSquare |]|
//@[10:11) RightSquare |]|
//@[11:12) RightSquare |]|
//@[12:13) Comma |,|
//@[14:15) LeftSquare |[|
//@[15:16) LeftSquare |[|
//@[16:17) LeftSquare |[|
//@[17:18) Integer |2|
//@[18:19) RightSquare |]|
//@[19:20) RightSquare |]|
//@[20:21) RightSquare |]|
//@[21:22) Comma |,|
//@[23:24) LeftSquare |[|
//@[24:25) LeftSquare |[|
//@[25:26) LeftSquare |[|
//@[26:27) Integer |3|
//@[27:28) RightSquare |]|
//@[28:29) RightSquare |]|
//@[29:30) RightSquare |]|
//@[30:31) RightSquare |]|
//@[31:32) NewLine |\n|
  ]
//@[02:03) RightSquare |]|
//@[03:04) NewLine |\n|
})
//@[00:01) RightBrace |}|
//@[01:02) RightParen |)|
//@[02:03) NewLine |\n|
type bar = int[][][][]
//@[00:04) Identifier |type|
//@[05:08) Identifier |bar|
//@[09:10) Assignment |=|
//@[11:14) Identifier |int|
//@[14:15) LeftSquare |[|
//@[15:16) RightSquare |]|
//@[16:17) LeftSquare |[|
//@[17:18) RightSquare |]|
//@[18:19) LeftSquare |[|
//@[19:20) RightSquare |]|
//@[20:21) LeftSquare |[|
//@[21:22) RightSquare |]|
//@[22:24) NewLine |\n\n|

type aUnion = 'snap'|'crackle'|'pop'
//@[00:04) Identifier |type|
//@[05:11) Identifier |aUnion|
//@[12:13) Assignment |=|
//@[14:20) StringComplete |'snap'|
//@[20:21) Pipe |||
//@[21:30) StringComplete |'crackle'|
//@[30:31) Pipe |||
//@[31:36) StringComplete |'pop'|
//@[36:38) NewLine |\n\n|

type expandedUnion = aUnion|'fizz'|'buzz'|'pop'
//@[00:04) Identifier |type|
//@[05:18) Identifier |expandedUnion|
//@[19:20) Assignment |=|
//@[21:27) Identifier |aUnion|
//@[27:28) Pipe |||
//@[28:34) StringComplete |'fizz'|
//@[34:35) Pipe |||
//@[35:41) StringComplete |'buzz'|
//@[41:42) Pipe |||
//@[42:47) StringComplete |'pop'|
//@[47:49) NewLine |\n\n|

type tupleUnion = ['foo', 'bar', 'baz']
//@[00:04) Identifier |type|
//@[05:15) Identifier |tupleUnion|
//@[16:17) Assignment |=|
//@[18:19) LeftSquare |[|
//@[19:24) StringComplete |'foo'|
//@[24:25) Comma |,|
//@[26:31) StringComplete |'bar'|
//@[31:32) Comma |,|
//@[33:38) StringComplete |'baz'|
//@[38:39) RightSquare |]|
//@[39:40) NewLine |\n|
|['fizz', 'buzz']
//@[00:01) Pipe |||
//@[01:02) LeftSquare |[|
//@[02:08) StringComplete |'fizz'|
//@[08:09) Comma |,|
//@[10:16) StringComplete |'buzz'|
//@[16:17) RightSquare |]|
//@[17:18) NewLine |\n|
|['snap', 'crackle', 'pop']
//@[00:01) Pipe |||
//@[01:02) LeftSquare |[|
//@[02:08) StringComplete |'snap'|
//@[08:09) Comma |,|
//@[10:19) StringComplete |'crackle'|
//@[19:20) Comma |,|
//@[21:26) StringComplete |'pop'|
//@[26:27) RightSquare |]|
//@[27:29) NewLine |\n\n|

type mixedArray = ('heffalump'|'woozle'|{ shape: '*', size: '*'}|10|-10|true|!true|null)[]
//@[00:04) Identifier |type|
//@[05:15) Identifier |mixedArray|
//@[16:17) Assignment |=|
//@[18:19) LeftParen |(|
//@[19:30) StringComplete |'heffalump'|
//@[30:31) Pipe |||
//@[31:39) StringComplete |'woozle'|
//@[39:40) Pipe |||
//@[40:41) LeftBrace |{|
//@[42:47) Identifier |shape|
//@[47:48) Colon |:|
//@[49:52) StringComplete |'*'|
//@[52:53) Comma |,|
//@[54:58) Identifier |size|
//@[58:59) Colon |:|
//@[60:63) StringComplete |'*'|
//@[63:64) RightBrace |}|
//@[64:65) Pipe |||
//@[65:67) Integer |10|
//@[67:68) Pipe |||
//@[68:69) Minus |-|
//@[69:71) Integer |10|
//@[71:72) Pipe |||
//@[72:76) TrueKeyword |true|
//@[76:77) Pipe |||
//@[77:78) Exclamation |!|
//@[78:82) TrueKeyword |true|
//@[82:83) Pipe |||
//@[83:87) NullKeyword |null|
//@[87:88) RightParen |)|
//@[88:89) LeftSquare |[|
//@[89:90) RightSquare |]|
//@[90:92) NewLine |\n\n|

type bool = string
//@[00:04) Identifier |type|
//@[05:09) Identifier |bool|
//@[10:11) Assignment |=|
//@[12:18) Identifier |string|
//@[18:20) NewLine |\n\n|

param inlineObjectParam {
//@[00:05) Identifier |param|
//@[06:23) Identifier |inlineObjectParam|
//@[24:25) LeftBrace |{|
//@[25:26) NewLine |\n|
  foo: string
//@[02:05) Identifier |foo|
//@[05:06) Colon |:|
//@[07:13) Identifier |string|
//@[13:14) NewLine |\n|
  bar: 100|200|300|400|500
//@[02:05) Identifier |bar|
//@[05:06) Colon |:|
//@[07:10) Integer |100|
//@[10:11) Pipe |||
//@[11:14) Integer |200|
//@[14:15) Pipe |||
//@[15:18) Integer |300|
//@[18:19) Pipe |||
//@[19:22) Integer |400|
//@[22:23) Pipe |||
//@[23:26) Integer |500|
//@[26:27) NewLine |\n|
  baz: sys.bool
//@[02:05) Identifier |baz|
//@[05:06) Colon |:|
//@[07:10) Identifier |sys|
//@[10:11) Dot |.|
//@[11:15) Identifier |bool|
//@[15:16) NewLine |\n|
} = {
//@[00:01) RightBrace |}|
//@[02:03) Assignment |=|
//@[04:05) LeftBrace |{|
//@[05:06) NewLine |\n|
  foo: 'foo'
//@[02:05) Identifier |foo|
//@[05:06) Colon |:|
//@[07:12) StringComplete |'foo'|
//@[12:13) NewLine |\n|
  bar: 300
//@[02:05) Identifier |bar|
//@[05:06) Colon |:|
//@[07:10) Integer |300|
//@[10:11) NewLine |\n|
  baz: false
//@[02:05) Identifier |baz|
//@[05:06) Colon |:|
//@[07:12) FalseKeyword |false|
//@[12:13) NewLine |\n|
}
//@[00:01) RightBrace |}|
//@[01:03) NewLine |\n\n|

param unionParam {property: 'ping'}|{property: 'pong'} = {property: 'pong'}
//@[00:05) Identifier |param|
//@[06:16) Identifier |unionParam|
//@[17:18) LeftBrace |{|
//@[18:26) Identifier |property|
//@[26:27) Colon |:|
//@[28:34) StringComplete |'ping'|
//@[34:35) RightBrace |}|
//@[35:36) Pipe |||
//@[36:37) LeftBrace |{|
//@[37:45) Identifier |property|
//@[45:46) Colon |:|
//@[47:53) StringComplete |'pong'|
//@[53:54) RightBrace |}|
//@[55:56) Assignment |=|
//@[57:58) LeftBrace |{|
//@[58:66) Identifier |property|
//@[66:67) Colon |:|
//@[68:74) StringComplete |'pong'|
//@[74:75) RightBrace |}|
//@[75:77) NewLine |\n\n|

param paramUsingType mixedArray
//@[00:05) Identifier |param|
//@[06:20) Identifier |paramUsingType|
//@[21:31) Identifier |mixedArray|
//@[31:33) NewLine |\n\n|

output outputUsingType mixedArray = paramUsingType
//@[00:06) Identifier |output|
//@[07:22) Identifier |outputUsingType|
//@[23:33) Identifier |mixedArray|
//@[34:35) Assignment |=|
//@[36:50) Identifier |paramUsingType|
//@[50:52) NewLine |\n\n|

type tuple = [
//@[00:04) Identifier |type|
//@[05:10) Identifier |tuple|
//@[11:12) Assignment |=|
//@[13:14) LeftSquare |[|
//@[14:15) NewLine |\n|
    @description('A leading string')
//@[04:05) At |@|
//@[05:16) Identifier |description|
//@[16:17) LeftParen |(|
//@[17:35) StringComplete |'A leading string'|
//@[35:36) RightParen |)|
//@[36:37) NewLine |\n|
    string
//@[04:10) Identifier |string|
//@[10:12) NewLine |\n\n|

    @description('A second element using a type alias')
//@[04:05) At |@|
//@[05:16) Identifier |description|
//@[16:17) LeftParen |(|
//@[17:54) StringComplete |'A second element using a type alias'|
//@[54:55) RightParen |)|
//@[55:56) NewLine |\n|
    bar
//@[04:07) Identifier |bar|
//@[07:08) NewLine |\n|
]
//@[00:01) RightSquare |]|
//@[01:03) NewLine |\n\n|

type stringStringDictionary = {
//@[00:04) Identifier |type|
//@[05:27) Identifier |stringStringDictionary|
//@[28:29) Assignment |=|
//@[30:31) LeftBrace |{|
//@[31:32) NewLine |\n|
    *: string
//@[04:05) Asterisk |*|
//@[05:06) Colon |:|
//@[07:13) Identifier |string|
//@[13:14) NewLine |\n|
}
//@[00:01) RightBrace |}|
//@[01:03) NewLine |\n\n|

@minValue(1)
//@[00:01) At |@|
//@[01:09) Identifier |minValue|
//@[09:10) LeftParen |(|
//@[10:11) Integer |1|
//@[11:12) RightParen |)|
//@[12:13) NewLine |\n|
@maxValue(10)
//@[00:01) At |@|
//@[01:09) Identifier |maxValue|
//@[09:10) LeftParen |(|
//@[10:12) Integer |10|
//@[12:13) RightParen |)|
//@[13:14) NewLine |\n|
type constrainedInt = int
//@[00:04) Identifier |type|
//@[05:19) Identifier |constrainedInt|
//@[20:21) Assignment |=|
//@[22:25) Identifier |int|
//@[25:27) NewLine |\n\n|

param mightIncludeNull ({key: 'value'} | null)[]
//@[00:05) Identifier |param|
//@[06:22) Identifier |mightIncludeNull|
//@[23:24) LeftParen |(|
//@[24:25) LeftBrace |{|
//@[25:28) Identifier |key|
//@[28:29) Colon |:|
//@[30:37) StringComplete |'value'|
//@[37:38) RightBrace |}|
//@[39:40) Pipe |||
//@[41:45) NullKeyword |null|
//@[45:46) RightParen |)|
//@[46:47) LeftSquare |[|
//@[47:48) RightSquare |]|
//@[48:50) NewLine |\n\n|

var nonNull = mightIncludeNull[0]!.key
//@[00:03) Identifier |var|
//@[04:11) Identifier |nonNull|
//@[12:13) Assignment |=|
//@[14:30) Identifier |mightIncludeNull|
//@[30:31) LeftSquare |[|
//@[31:32) Integer |0|
//@[32:33) RightSquare |]|
//@[33:34) Exclamation |!|
//@[34:35) Dot |.|
//@[35:38) Identifier |key|
//@[38:40) NewLine |\n\n|

output nonNull string = nonNull
//@[00:06) Identifier |output|
//@[07:14) Identifier |nonNull|
//@[15:21) Identifier |string|
//@[22:23) Assignment |=|
//@[24:31) Identifier |nonNull|
//@[31:33) NewLine |\n\n|

var maybeNull = mightIncludeNull[0].?key
//@[00:03) Identifier |var|
//@[04:13) Identifier |maybeNull|
//@[14:15) Assignment |=|
//@[16:32) Identifier |mightIncludeNull|
//@[32:33) LeftSquare |[|
//@[33:34) Integer |0|
//@[34:35) RightSquare |]|
//@[35:36) Dot |.|
//@[36:37) Question |?|
//@[37:40) Identifier |key|
//@[40:42) NewLine |\n\n|

var maybeNull2 = mightIncludeNull[0][?'key']
//@[00:03) Identifier |var|
//@[04:14) Identifier |maybeNull2|
//@[15:16) Assignment |=|
//@[17:33) Identifier |mightIncludeNull|
//@[33:34) LeftSquare |[|
//@[34:35) Integer |0|
//@[35:36) RightSquare |]|
//@[36:37) LeftSquare |[|
//@[37:38) Question |?|
//@[38:43) StringComplete |'key'|
//@[43:44) RightSquare |]|
//@[44:46) NewLine |\n\n|

output maybeNull string? = maybeNull
//@[00:06) Identifier |output|
//@[07:16) Identifier |maybeNull|
//@[17:23) Identifier |string|
//@[23:24) Question |?|
//@[25:26) Assignment |=|
//@[27:36) Identifier |maybeNull|
//@[36:38) NewLine |\n\n|

type nullable = string?
//@[00:04) Identifier |type|
//@[05:13) Identifier |nullable|
//@[14:15) Assignment |=|
//@[16:22) Identifier |string|
//@[22:23) Question |?|
//@[23:25) NewLine |\n\n|

type nonNullable = nullable!
//@[00:04) Identifier |type|
//@[05:16) Identifier |nonNullable|
//@[17:18) Assignment |=|
//@[19:27) Identifier |nullable|
//@[27:28) Exclamation |!|
//@[28:29) NewLine |\n|

//@[00:00) EndOfFile ||
