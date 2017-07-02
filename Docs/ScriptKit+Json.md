## ScriptKit extension for Json


### Dictionary

<details>
<summary>Convert a binary json to a dictionary</summary>

`public class func json2dictionary(_ pData:Data) -> [String:Any]`

 - Parameter:
   - pData: Json in binary form
 - Returns: a dictionary. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Convert a dictionary to a binary json</summary>

`public class func dictionary2json(_ pDictionary:[String:Any]) -> Data?`

 - Parameter:
   - pDictionary: Dictionary to convert
 - Returns: a json in binary form
</details>

<details>
<summary>Convert dictionary to a json string</summary>

`public class func dictionary2strjson(_ pDictionary:[String:Any],format pFormat:Bool = false, padding pPadding:String = "") -> String?`

 - Parameters:
   - pDictionary: Dictionary to convert
   - pFormat: `true` format the json, `false` generate flat json string
   - pPadding: Put the string before each line
 - Returns: a json string
</details>

### Array

<details>
<summary>Convert a binary json to an array</summary>

`public class func json2array(_ pData:Data) -> [Any]`

 - Parameter:
   - pData: Json in binary form
 - Returns: an array of objects. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Convert an array to a binary json</summary>

`public class func array2json(_ pArray:[Any]) -> Data?`

 - Parameter:
   - pArray: Array to convert
 - Returns: a binary json. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Convert an array to json string</summary>

`public class func array2strjson(_ pArray:[Any],format pFormat:Bool = false, padding pPadding:String = "") -> String?`

 - Parameters:
   - pArray: Array to convert
   - pFormat: `true` format the json, `false` generate flat json string
   - pPadding: Put the string before each line
 - Returns: a json string. If an error occur the variable `error` is set with the error.
</details>

### Object

<details>
<summary>Convert a binary json to an object</summary>

`public class func json2obj(_ pData:Data) -> Any?`

 - Parameter:
   - pData: Binary json
 - Returns: an object
</details>

<details>
<summary>Convert an object to a binary json</summary>

`public class func obj2json(_ pObj:Any) -> Data?`

 - Parameter:
   - pObj: Object
 - Returns: a binary json
</details>

<details>
<summary>Convert an object to a json string</summary>

`public class func obj2string(_ pObj:Any, format pFormat:Bool = false, padding pPadding:String = "") -> String?`

 - Parameters:
   - pObj: Object to convert
   - pFormat: `true` format the json, `false` generate flat json string
   - pPadding: Put the string before each line
 - Returns: a json string
</details>

