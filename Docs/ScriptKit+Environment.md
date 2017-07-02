## ScriptKit extension for environment


### Manage process environment

`public class Environment`

<details>
<summary>Current process environment</summary>

`public var current:[String:String] = ProcessInfo.processInfo.environment`
</details>

<details>
<summary>Subscript use to get and set variables environment</summary>

`public subscript(_ pKey:String) -> String?`

 Trensmit to the sub-process by `Shell` object

 - Parameter:
   - pKey: Variable name
</details>

