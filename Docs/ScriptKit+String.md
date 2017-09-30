## String extension for ANSI and tools methods


### Expose forground ANSI colors

`public struct Fg`

<details>
<summary>Insert a reset ANSI code before your string</summary>

`public var reset:String`
</details>

<details>
<summary>Insert ANSI text black color before your string</summary>

`public var black:String`
</details>

<details>
<summary>Insert ANSI text red color before your string</summary>

`public var red:String`
</details>

<details>
<summary>Insert ANSI text green color before your string</summary>

`public var green:String`
</details>

<details>
<summary>Insert ANSI text yellow color before your string</summary>

`public var yellow:String`
</details>

<details>
<summary>Insert ANSI text blue color before your string</summary>

`public var blue:String`
</details>

<details>
<summary>Insert ANSI text magenta color before your string</summary>

`public var magenta:String`
</details>

<details>
<summary>Insert ANSI text cyan color before your string</summary>

`public var cyan:String`
</details>

<details>
<summary>Insert ANSI text white color before your string</summary>

`public var white:String`
</details>

<details>
<summary>Select color in 256 forground colors</summary>

`public func c256(_ pColor:Int) -> String`

 Color table available here: [Bash tips: Colors and formatting (ANSI/VT100 Control sequences)](http://misc.flogisoft.com/bash/tip_colors_and_formatting)

 - Parameter:
   - pColor: Color index
 - Returns: string with color index
</details>

<details>
<summary>Original string</summary>

`private let string: String`
</details>

<details>
<summary>Contstructor with the original string</summary>

`public init(string pString:String)`

 - Parameter:
   - pString: Original string
</details>

### Expose background ANSI colors

`public struct Bg`

<details>
<summary>Insert a reset ANSI code before your string</summary>

`public var reset:String`
</details>

<details>
<summary>Insert ANSI background black color before your string</summary>

`public var black:String`
</details>

<details>
<summary>Insert ANSI background red color before your string</summary>

`public var red:String`
</details>

<details>
<summary>Insert ANSI background green color before your string</summary>

`public var green:String`
</details>

<details>
<summary>Insert ANSI background yellow color before your string</summary>

`public var yellow:String`
</details>

<details>
<summary>Insert ANSI background blue color before your string</summary>

`public var blue:String`
</details>

<details>
<summary>Insert ANSI background magenta color before your string</summary>

`public var magenta:String`
</details>

<details>
<summary>Insert ANSI background cyan color before your string</summary>

`public var cyan:String`
</details>

<details>
<summary>Insert ANSI background white color before your string</summary>

`public var white:String`
</details>

<details>
<summary>Select color in 256 background colors</summary>

`public func c256(_ pColor:Int) -> String`

 Color table available here: [Bash tips: Colors and formatting (ANSI/VT100 Control sequences)](http://misc.flogisoft.com/bash/tip_colors_and_formatting)

 - Parameter:
   - pColor: Color index
 - Returns: string with color index
</details>

<details>
<summary>Original string</summary>

`private let string: String`
</details>

<details>
<summary>Contstructor with the original string</summary>

`public init(string pString:String)`

 - Parameter:
   - pString: Original string
</details>

### Expose style ANSI codes

`public struct Style`

<details>
<summary>Insert a reset ANSI code before your string</summary>

`public var reset:String`
</details>

<details>
<summary>Insert a bright ANSI code before your string</summary>

`public var bright:String`
</details>

<details>
<summary>Insert a dim ANSI code before your string</summary>

`public var dim:String`
</details>

<details>
<summary>Insert a underscore ANSI code before your string</summary>

`public var underscore:String`
</details>

<details>
<summary>Insert a blink ANSI code before your string</summary>

`public var blink:String`
</details>

<details>
<summary>Insert a reverse ANSI code before your string</summary>

`public var reverse:String`
</details>

<details>
<summary>Insert a hidden ANSI code before your string</summary>

`public var hidden:String`
</details>

<details>
<summary>Original string</summary>

`private let string: String`
</details>

<details>
<summary>Contstructor with the original string</summary>

`public init(string pString:String)`

 - Parameter:
   - pString: Original string
</details>

### Expose commands ANSI codes

`public struct Cmd`

<details>
<summary>Insert a clear ANSI code before your string</summary>

`public var clear:String`
</details>

<details>
<summary>Insert a clear line ANSI code before your string</summary>

`public var clearLine:String`
</details>

<details>
<summary>Insert a clear end of line ANSI code before your string</summary>

`public var eol:String`
</details>

<details>
<summary>Insert a clear start of line ANSI code before your string</summary>

`public var sol:String`
</details>

<details>
<summary>Insert a save ANSI code before your string</summary>

`public var save:String`
</details>

<details>
<summary>Insert a restore ANSI code before your string</summary>

`public var restore:String`
</details>

<details>
<summary>Insert a home ANSI code before your string</summary>

`public var home:String`
</details>

<details>
<summary>Insert cursor position code before your string</summary>

`public func cursor(line pLine:Int, column pColumn:Int) -> String`

 - Parameters:
   - pLine: line where you want to position the cursor
   - pColumn: Column where you want to position the cursor
 - Returns: ANSI code with cursor position and original string
</details>

<details>
<summary>Insert up lines instruction before your string</summary>

`public func up(line pLine:Int) -> String`

 - Parameter:
   - pLine: Number of lines
 - Returns: ANSI instructions with up lines and original string
</details>

<details>
<summary>Insert down lines instruction before your string</summary>

`public func down(line pLine:Int) -> String`

 - Parameter:
   - pLine: Number of lines
 - Returns: ANSI instructions with down lines and original string
</details>

<details>
<summary>Insert right columns instruction before your string</summary>

`public func right(column pColumn:Int) -> String`

 - Parameter:
   - pColumn: Number of columns
 - Returns: ANSI instructions with right columns and original string
</details>

<details>
<summary>Insert left columns instruction before your string</summary>

`public func left(column pColumn:Int) -> String`

 - Parameter:
   - pColumn: Number of columns
 - Returns: ANSI instructions with left columns and original string
</details>

<details>
<summary>Original string</summary>

`private let string: String`
</details>

<details>
<summary>Contstructor with the original string</summary>

`public init(string pString:String)`

 - Parameter:
   - pString: Original string
</details>

### Alias properties

<details>
<summary>Alias to style property</summary>

`public var s:Style`
</details>

<details>
<summary>Access to ANSI style</summary>

`public var style:Style`
</details>

<details>
<summary>Alias to forground property</summary>

`public var fg:Fg`
</details>

<details>
<summary>Access to ANSI forground colors</summary>

`public var forground:Fg`
</details>

<details>
<summary>Alias to background property</summary>

`public var bg:Bg`
</details>

<details>
<summary>Access to ANSI background colors</summary>

`public var background:Bg`
</details>

<details>
<summary>Alias to cmd property</summary>

`public var c:Cmd`
</details>

<details>
<summary>Access to ANSI commands</summary>

`public var cmd:Cmd`
</details>

<details>
<summary>Length of the string</summary>

`public var length:Int`
</details>

### ANSI methods

<details>
<summary>Insert ANSI code after the string</summary>

`public func esc(_ pCode:String) -> String`

 - Parameter:
   - pCode: ANSI code
 - Returns: string with the ANSI code
</details>

### Format methods

<details>
<summary>Format bytes</summary>

`public static func format(bytes pBytes:Float, decimal pDecimal:Int = 0) -> String`

 - Parameters:
   - pBytes: Bytes value
   - pDecimal: Decimal you want to display
 - Returns: generate a string with the bytes in B (bytes), KB, MB, GB, TB, PB, EB, ZB, YB
</details>

<details>
<summary>Format speed</summary>

`public static func format(speed pSpeed:Float, decimal pDecimal:Int = 0) -> String`

 - Parameters:
   - pSpeed: Speed in bytes per second
   - pDecimal: Decimal you want to display
 - Returns: generate a string with the bytes in B/s (bytes), KB/s, MB/s, GB/s, TB/s, PB/s, EB/s, ZB/s, YB/s
</details>

<details>
<summary>Format time interval</summary>

`public static func format(timeInterval pTimeInterval: TimeInterval) -> String`

 - Parameter
   - pTimeInterval: Time interval value
 - Returns: strime with the time interval formated
</details>

### Subscripts

<details>
<summary>Char of a string</summary>

`public subscript(pIndex: Int) -> String`

 - Parameter:
   - pIndex: Index in the string
</details>

<details>
<summary>Extract a countable range of a string</summary>

`public subscript(pRange: CountableRange<Int>) -> String`

 - Parameter:
   - pRange: A countable range
</details>

<details>
<summary>Extract a countable closed range of a string</summary>

`public subscript(pRange: CountableClosedRange<Int>) -> String`

 - Parameter:
   - pRange: A countable closed range
</details>

### Extract methods

<details>
<summary>Replace a substring by another substring</summary>

`public func replace(string pString:String, sub pSub:String, nb pNb:Int = -1) -> String`

 - Parameters:
   - pString: Search substring
   - pSub: Replace substring
   - pNb: Number of occurence you want to replace. By default all.
 - Returns: a new instance of which was the replacement, otherwise return the original string
</details>

<details>
<summary>Extract string before a specific string</summary>

`public func before(_ pString:String) -> String?`

 - Parameter:
   - pString: String to search
 - Returns: a new instance with the string before the string in parameter, otherwise return `nil`
</details>

<details>
<summary>Extract string after a specific string</summary>

`public func after(_ pString:String) -> String?`

 - Parameter:
   - pString: String to search
 - Returns: a new instance with the string after the string in parameter, otherwise return `nil`
</details>

<details>
<summary>Extract the last occurence</summary>

`public func lastWord(_ pSeparator:String = " ") -> String?`

 - Parameter:
   - pSeparator: Split the string with this separator
 - Returns: last occurence of string, otherwise return `nil`
</details>

<details>
<summary>Extract the string without the last occurence</summary>

`public func withoutLastWord(_ pSeparator:String = " ") -> String?`

 - Parameter:
   - pSeparator: Split the string with this separator
 - Returns: string without the last occurence, otherwise return `nil`
</details>

### Trim methods

<details>
<summary>Trim the beginning of the string</summary>

`public func trimStart(_ pCharacters:String = " \n\r\t") -> String`

 - Parameter:
   - pCharacters: Set of characters you want to remove. By default set to " \n\r\t"
 - Returns: a new string without the characters specify in the parameter, otherwise return the original string
</details>

<details>
<summary>Trim the end of the string</summary>

`public func trimEnd(_ pCharacters:String = " \n\r\t") -> String`

 - Parameter:
   - pCharacters: Set of characters you want to remove. By default set to " \n\r\t"
 - Returns: a new string without the characters specify in the parameter, otherwise return the original string
</details>

<details>
<summary>Trim both begining and end of the string</summary>

`public func trim(_ pCharacters:String = " \n\r\t") -> String`

 - Parameter:
   - pCharacters: Set of characters you want to remove. By default set to " \n\r\t"
 - Returns: a new string without the characters specify in the parameter, otherwise return the original string
</details>

### Split methods

<details>
<summary>Split a string into substrings of equal length</summary>

`public func split(size pSize: Int) -> [String]`

 - Parameter:
   - pSize: Size of each substrings
 - Returns: an array of strings
</details>

### Replace methods

<details>
<summary>Search all occurence of a string and replace them by another string</summary>

`public func replace(search pSearch:String, with pWith:String, nb pNb:Int = -1) -> String`

 - Parameters:
   - pSearch: String to search
   - pWith: Replace string
   - pNb: Number of occurences. By default -1 for all occurences
 - Returns: a new string with the modification
</details>

### RegEx methods

<details>
<summary>Search all occurence of a regex and replace by a template for each</summary>

`public func replace(regEx pRegEx: String, template pTemplate: String, partial pPartial:Bool = false) -> String?`

 - Parameters:
   - pRegEx: Regular expression use to search
   - pTemplate: Template use to replace
 - Returns: a new string with the modification
</details>

<details>
<summary>Extract all occurences of a regex</summary>

`public func extract(regEx pRegEx: String) -> [String]`

 - Parameter:
   - pRegEx: Regular Expression to extract
 - Returns: an array with all occurence of the regex
</details>

<details>
<summary>Check if the string match a regex</summary>

`public func match(regEx pRegEx: String, partial pPartial:Bool = false) -> Bool`

 - Parameter:
   - pRegEx: Regular Expression
   - pPartial: `false` must match all the string, `true` partial match is accepted
 - Returns: `true` if the regex match with the string. Otherwise return `false`
</details>

