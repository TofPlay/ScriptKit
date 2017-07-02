## ScriptKit extension for Shell


### Manage the shell to execute some others applications

`public class Shell`

#### Properties

<details>
<summary>Last command</summary>

`public var command:String = ""`
</details>

<details>
<summary>Exit value of the external process</summary>

`public var exit:Int32 = 0`
</details>

<details>
<summary>Check if the shell is running</summary>

`public var isRunning:Bool`
</details>

#### Construstor

<details>
<summary>Constructor with de command</summary>

`public init(_ pCommand:String)`

 Like:
 ```
 ls -l /Users
 ```

 - Parameter:
   - pCommand: Command
</details>

#### Methods

<details>
<summary>Execute some command in the shell</summary>

`public func run(_ pCmd:String? = nil, size pSize:Int=80, seperator pSeperator:String = "", readLine pReadLine:Readline? = nil) -> Self`

 Example:
 ```
 /bin/sh -c "<instructions>"
 ```
 You catch stdout and stderr with an handler. And you can adjust the speed by setting the size of the buffer.
 If your buffer is too big you will receive multiple lines in one time and you can not display the line it's comming.
 It's why by default the size is set to 80 bytes. It's almost the size of one line in the screen.

 - Parameters:
   - pCmd: Commands execute by the shel
   - pSize: Size of the cache. The handler is call when the cache is full.
   - pSeperator: Characters to cut the buffer in lines
   - pReadLine: Handler call for each line receive
 - Returns: the object for chainning
</details>

<details>
<summary>Wait until the shell is finished processing the instructions</summary>

`public func wait() -> Int32`

 That also expects that we are finished reading the data on stdout and stderr.

 - Returns: exit status returned by the receiver’s shell.
</details>

<details>
<summary>Suspends execution of the receiver task.</summary>

`public func suspend() -> Bool`

 Multiple suspend() messages can be sent, but they must be balanced with an equal number of resume() messages before the task resumes execution.

 - Returns: `true` if the receiver was successfully suspended, `false` otherwise.
</details>

<details>
<summary>Resumes execution of the receiver task</summary>

`public func resume() -> Bool`

 The task had previously been suspended with a `suspend()` method.
 If multiple `suspend()` method were sent to the receiver, an equal number of `resume()` messages must be sent before the task resumes execution.

 - Returns: `true` if the receiver was able to resume execution, `false` otherwise.
</details>

<details>
<summary>Sends an interrupt signal to the receiver and all of its subtasks.</summary>

`public func interrupt()`
</details>

<details>
<summary>Sends a terminate signal to the receiver and all of its subtasks.</summary>

`public func terminate()`
</details>

