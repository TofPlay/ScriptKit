## ScriptKit extension for console methods


<details>
<summary>Clear the screen</summary>

`public class func clear() -> ScriptKit.Type`

 - Returns: ScriptKit class object for chaining
</details>

<details>
<summary>Clear from the cursor to the end of line</summary>

`public class func clearEOL() -> ScriptKit.Type`

 - Returns: ScriptKit class object for chaining
</details>

<details>
<summary>Clear from the cursor to the start of line</summary>

`public class func clearSOL() -> ScriptKit.Type`

 - Returns: ScriptKit class object for chaining
</details>

<details>
<summary>Clear the current line</summary>

`public class func clearLine() -> ScriptKit.Type`

 - Returns: ScriptKit class object for chaining
</details>

<details>
<summary>Save cursor position</summary>

`public class func save() -> ScriptKit.Type`

 - Returns: ScriptKit class object for chaining
</details>

<details>
<summary>Restore cursor position</summary>

`public class func restore() -> ScriptKit.Type`

 - Returns: ScriptKit class object for chaining
</details>

<details>
<summary>Position the cursor on the row 0 column 0</summary>

`public class func home() -> ScriptKit.Type`

 - Returns: ScriptKit class object for chaining
</details>

<details>
<summary>Change the positon of the cursor</summary>

`public class func cursor(_ pLine:Int, _ pColumn:Int) -> ScriptKit.Type`

 - Parameters:
   - pLine: Line
   - pColumn: Column
 - Returns: ScriptKit class object for chaining
</details>

<details>
<summary>Returns the size of the terminal window</summary>

`public class func screenSize() -> (width: Int, height: Int)`

 - Returns: ScriptKit class object for chaining
</details>

<details>
<summary>Format a title with a description</summary>

`public class func print(title pTitle:String, description pDescription:String) -> ScriptKit.Type`

 - Parameters:
   - pTitle: Title
   - pDescription: Description
 - Returns: ScriptKit class object for chaining
</details>

<details>
<summary>Displays a string at the current position on stdout</summary>

`public class func print(_ pString:String) -> ScriptKit.Type`

 - Parameter:
   - pString: String to display
 - Returns: ScriptKit class object for chaining
</details>

<details>
<summary>Displays a string at the current position on stdout or stderr</summary>

`public class func print(output pOutput:Output, _ pString:String) -> ScriptKit.Type`

 - Parameters:
   - pOutput: Specifies where the string is displayed. Can take values `stdout` or `stderr`
   - pString: String to display
 - Returns: ScriptKit class object for chaining
</details>

<details>
<summary>Format a string by taking the values after `format` and display it on `stdout` or `stderr`</summary>

`public class func print(output pOutput:Output = .stdout, format pFormat:String, _ pArgs:CVarArg...) -> ScriptKit.Type`

 - Parameters:
   - pOutput: Specifies where the string is displayed. Can take values `stdout` or `stderr`
   - pFormat: String format
   - pArgs: Values associate with the string format
 - Returns: ScriptKit class object for chaining
</details>

<details>
<summary>Allows the user to enter text</summary>

`public class func input(_ pText:String="", handler pHandler:ConsoleHandler? = nil) -> ScriptKit.Type`

 - Parameters:
   - pText: Display a text before the input
   - pHandler: Call the handler when the user click on ⏎
 - Returns: ScriptKit class object for chaining
</details>

