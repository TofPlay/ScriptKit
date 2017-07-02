## ScriptKit extension for Plist


<details>
<summary>Convert a binary plist to a dictionary</summary>

`public class func plist2dictionary(_ pData:Data) -> [String:Any]`

 - Parameter:
   - pData: Binary plist
 - Returns: a dictonary
</details>

<details>
<summary>Convert a dictionary to a binary plist</summary>

`public class func dictionary2plist(_ pDictionary:[String:Any], format pFormat:PropertyListSerialization.PropertyListFormat = .xml) -> Data?`

 - Parameters:
   - pDictionary: Dictionary object
   - pFormat: Type of plist you want to generate
 - Returns: a binary plist
</details>

