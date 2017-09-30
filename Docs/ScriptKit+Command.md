## ScriptKit extension for commands


### Manage display

`public struct Display`

<details>
<summary>Last action done</summary>

`public static var lastAction:Type = .none`
</details>

<details>
<summary>Enable verbose mode</summary>

`public static var verbose:Bool = false`
</details>

<details>
<summary>Level of actions</summary>

`public static var level:Int = 0`
</details>

### Properties

<details>
<summary>Version of the tool</summary>

`public static var version:String = ""`
</details>

<details>
<summary>Copyright of the tool</summary>

`public static var owner:String = ""`
</details>

<details>
<summary>Year of the tool</summary>

`public static var year:String = ""`
</details>

<details>
<summary>Description of the tool</summary>

`public static var info:String = ""`
</details>

<details>
<summary>Last error</summary>

`public static var error:Error? = nil`
</details>

<details>
<summary>The variable names (keys) and their values in the environment from which the process was launched.</summary>

`public static var environment:[String:String]`
</details>

### Declare command line interface

<details>
<summary>Declare version, copyright, year and a description of what your command line app is doing</summary>

`public class func program(version pVersion:String, owner pOwner:String, year pYear:String="", info pInfo:String="")`
 ATTENTION: This method will reset all internal datas. You will loose all previous settings

 - Parameters:
   - pVersion: Version of your app
   - pOwner: Owner of your app
   - pYear: Year of your app
   - pInfo: Description of what your application is doing
 - Returns: ScriptKit class object for chaining settings
</details>

<details>
<summary>Your application can define a collection of commands and sub-commands</summary>

`public class func cmd(_ pName:String, variable pVariable:String?=nil, title pTitle:String="", help pHelp:String="", handler pCmdHandler:CmdHandler? = nil)`

 Each command have his own keyword, a text that describ the commande and instructions

 - Parameters:
   - pName: Key word for this command
   - pVariable: Store the next value after the command on this variable
   - pTitle: A short descrition of this command
   - pHelp: A long descrition of this command
   - pCmdHandler: Instrutions of this command
 - Returns: ScriptKit class object for chaining settings
</details>

<details>
<summary>You can define a command with it's keyword and description, and later provide the instructions.</summary>

`public class func cmd(handler pCmdHandler:@escaping CmdHandler)`
 This methode will association the instructions to the current command.

 - Parameter:
   - pCmdHandler: Instructions to associate to the current command
 - Returns: ScriptKit class object for chaining settings
</details>

<details>
<summary>You can change the handler if you the path of a command</summary>

`public class func cmd(path pPath:String, handler pCmdHandler:@escaping CmdHandler)`

 - Parameters:
   - pPath: Path to the command.
   - pCmdHandler: Instructions associated with the command
</details>

<details>
<summary>You can change the title or/and the help if you the path of a command</summary>

`public class func cmd(path pPath:String, title pTile:String? = nil, help pHelp:String? = nil)`

 - Parameters:
   - pPath: Path to the command.
   - pCmdHandler: Instructions associated with the command
</details>

<details>
<summary>Each command can define a set of options. Each option must define a long keyword and a variable. A short keyword, a default value for the variable,</summary>

`public class func option(short pShort:String="", long pLong:String, variable pVariable:String, `default` pDefault:String?=nil, value pValue:String?=nil, optional pOptional:Bool=true, title pTitle:String="", help pHelp:String="")`
 are optionals.

 - Parameters:
   - pShort: Define a short keyword for the option. By default is empty.
   - pLong: Define a long keyword for the option
   - pVariable: Associate a variable to the option
   - pDefault: Defined a default value for the variable. By default is `nil` for not used.
   - pOptional: `true` the option is optional, `false` is required. By default is optional.
   - pTitle: A short descrition of this command
   - pHelp: A long descrition of this command
 - Returns: ScriptKit class object for chaining settings
</details>

<details>
<summary>Use to introduce a new sub-command of the current command</summary>

`public class func begin()`

 - Returns: ScriptKit class object for chaining settings
</details>

<details>
<summary>Use to get back to the parent command</summary>

`public class func end()`

 - Returns: ScriptKit class object for chaining settings
</details>

<details>
<summary>It's the main method of your command line. It's where everthing begin.</summary>

`public class func run(arguments pArguments:[String])`

 This method check, validate and execute your command.
 Call it like this:
 ```
  // main.swift
  import Foundation
  import ScriptKit

  public class MyCommandLineTool : ScriptKit {
    public class func main() {
      run(arguments: CommandLine.arguments)
   }
 }
 ```
 - Parameter:
   - pArguments: Array of paramèters
</details>

### Display methods

<details>
<summary>Display different types of messages</summary>

`public class func display(type pType:Display.`Type`, verbose pVerbose:Bool = false, clear pClear:Bool = false, format pFormat:String = "",_ pArgs:CVarArg...)`

 - Parameters:
   - pType: Type of message. Can be `info`, `warning`, `error`, `yes`, `no`, `compute`, `build`, `action`, `msg` or `done`.
   - pVerbose: `true` display the message
   - pClear: `true` erase the current line, `false` display the message to the next line. By default `compute` message are erase by a next message
   - pFormat: Format of the message
   - pArgs: Parameters associate to the format
</details>

