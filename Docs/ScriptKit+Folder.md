## ScriptKit extension for folders and files


### Default folders properties

<details>
<summary>Home user directory (~/)</summary>

`public static var homeDirectory:String`
</details>

<details>
<summary>Temp directory</summary>

`public static var tempDirectory:String`
</details>

<details>
<summary>Desktop directory (~/Desktop/)</summary>

`public static var desktopDirectory:String`
</details>

<details>
<summary>Temp directory</summary>

`public static var documentDirectory:String`
</details>

<details>
<summary>Application support directory (Library/Application Support)</summary>

`public static var applicationSupportDirectory:String`
</details>

<details>
<summary>Cache directory (Library/Caches)</summary>

`public static var cachesDirectory:String`
</details>

### Check methods

<details>
<summary>Check if the path is a directory</summary>

`public class func isDir(_ pPath:String) -> Bool`

 - Parameter:
   - pPath: Path to check
 - Returns: `true` if it's a directory, otherwise `false`
</details>

<details>
<summary>Check if the path is a file</summary>

`public class func isFile(_ pPath:String) -> Bool`

 - Parameter:
   - pPath: Path to check
 - Returns: `true` if it's a file, otherwise `false`
</details>

<details>
<summary>Check if the path is a link</summary>

`public class func isLink(_ pPath:String) -> Bool`

 - Parameter:
   - pPath: Path to check
 - Returns: `true` if it's a link, otherwise `false`
</details>

<details>
<summary>Check if the path is an executable</summary>

`public class func isExec(_ pPath:String) -> Bool`

 - Parameter:
   - pPath: Path to check
 - Returns: `true` if it's an executable, otherwise `false`
</details>

<details>
<summary>Check if the path is readable</summary>

`public class func isRead(_ pPath:String) -> Bool`

 - Parameter:
   - pPath: Path to check
 - Returns: `true` if it's readable, otherwise `false`
</details>

<details>
<summary>Check if the path is writeable</summary>

`public class func isWrite(_ pPath:String) -> Bool`

 - Parameter:
   - pPath: Path to check
 - Returns: `true` if it's writeable, otherwise `false`
</details>

<details>
<summary>Check if we can delete the path</summary>

`public class func isDel(_ pPath:String) -> Bool`

 - Parameter:
   - pPath: Path to check
 - Returns: `true` if we can delete the path, otherwise `false`
</details>

<details>
<summary>Check if the path exist</summary>

`public class func exist(path pPath: String) -> Bool`

 - Parameter:
   - pPath: Path to check
 - Returns: `true` if the path exist, otherwise `false`
</details>

### Link methods

<details>
<summary>Creates a hard link between the items at the specified paths.</summary>

`public class func link(hard pHard:String, path pPath:String) -> Bool`

 - Parameters:
   - pHard: The path that specifies the item you wish to link to.
   - pPath: The path that identifies the location where the link will be created.
 - Returns: `true` if the link is created, otherwise return `false`
</details>

<details>
<summary>Creates a symbolic link that points to the specified destination.</summary>

`public class func link(symbolic pSymbolic:String, path pPath:String) -> Bool`

 - Parameters:
   - pSymbolic: The path at which to create the new symbolic link. The last path component is used as the name of the link.
   - pPath: The path that contains the item to be pointed to by the link. In other words, this is the destination of the link.
 - Returns: `true` if the link is created, otherwise return `false`
</details>

### Path methods

<details>
<summary>Returns the path of the item pointed to by a symbolic link.</summary>

`public class func abs(symbolicLink pSymbolicLink:String) -> String?`

 - Parameter:
   - pSymbolicLink: Path to a symbolic link
 - Returns: Returns the path of the item pointed to by a symbolic link.
</details>

<details>
<summary>Convert a relative path to an absolute path</summary>

`public class func abs(path pPath:String) -> String`

 - Parameter:
   - pPath: Any path
 - Returns: an absolute path
</details>

<details>
<summary>Normalized the path</summary>

`public class func norm(path pPath:String) -> String`

 - Parameter:
   - pPath: Any path
 - Returns: a path normalized
</details>

<details>
<summary>Extract the directory of a path</summary>

`public class func dir(path pPath:String) -> String`

 For example:
 ```
  print(dir(path: "/Users/JohnDoe/notes.txt"))
 ```
  Will diplayed:
  ```
  /Users/JohnDoe
  ```
 - Parameter:
   - pPath: Any path
 - Returns: the directory
</details>

<details>
<summary>Extract the file name + extension of a path</summary>

`public class func fullname(path pPath:String) -> String`

 For example:
 ```
  print(name(path: "/Users/JohnDoe/notes.txt"))
 ```
  Will diplayed:
  ```
  notes.txt
  ```
 - Parameter:
   - pPath: Any path
 - Returns: the file name
</details>

<details>
<summary>Extract the file name of a path</summary>

`public class func name(path pPath:String) -> String`

 For example:
 ```
  print(name(path: "/Users/JohnDoe/notes.txt"))
 ```
  Will diplayed:
  ```
  notes
  ```
 - Parameter:
   - pPath: Any path
 - Returns: the file name
</details>

<details>
<summary>Extract the extension of a path</summary>

`public class func ext(path pPath:String) -> String`

 For example:
 ```
  print(ext(path: "/Users/JohnDoe/notes.txt"))
 ```
  Will diplayed:
  ```
  txt
  ```
 - Parameter:
   - pPath: Any path
 - Returns: the extension
</details>

### List methods

<details>
<summary>Finds all the pathnames matching a specified pattern</summary>

`public class func glob(path pPath:String, recursive pRecursive:Bool = false, absPath pAbsPath:Bool = false) -> [String]`

 The pattern is define as a directory path follow by a regular expresion.

 For example:
 ```
  glob("/Users/JohnDoe/Documents/bill[0-9]*\\..*")
 ```
  Will return:
  ```
  /User/JohnDoe/Documents/bill2014/
  /User/JohnDoe/Documents/bill2015/
  /User/JohnDoe/Documents/bill2016/
  /User/JohnDoe/Documents/bill001.pdf
  /User/JohnDoe/Documents/bill002.pdf
  /User/JohnDoe/Documents/bill003.pdf
  ...
  ```
 - Parameters:
   - pPath: Direcotry path + the RegEx
   - pRecursive: `true` will search on sub-directory, `false` search only on the directory path
   - pAbsPath: `true` return the fullpath for each item, `false` return juste the directory path for each item
 - Returns: an Array with all files and directory that match the RegEx
</details>

### Tools methods

<details>
<summary>Simulate "whereis"`" instruction</summary>

`public class func whereis(_ pName:String) -> String?`

 Extract paths from PATH and check if a program exist on these paths

 - Parameter:
   - pName: Program name
 - Returns: full path of the program if exist, otherwise return `nil`
</details>

### Handles methods

<details>
<summary>Copy a path to another path</summary>

`public class func cp(path pPath:String, to pTo:String) -> Bool`

 - Parameters:
   - pPath: Original path
   - pTo: Target path
 - Returns: `true` unable to copy the original to the target path, otherwise return `false`. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Remove a path</summary>

`public class func rm(path pPath:String) -> Bool`

 Could be a file or an empty directory

 - Parameter:
   - pPath: Path to remove
 - Returns: `true` the path is removed, otherwise return `false`. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Move a file or a directory</summary>

`public class func mv(at pAt:String, to pTo:String) -> Bool`

 - Parameters:
   - pAt: Original file or directory
   - pTo: Target path
 - Returns: `true` the path is moved, otherwise return `false`. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Change the permission of the file's</summary>

`public class func chmod(path pPath:String, value pValue:Int) -> Bool`

 - Parameters:
   - pPath: Path you want to change the permission
   - pValue: New mdofication the permission. Must be an octal value.
 - Returns: `true` if it changed successfully, otherwise return `false`. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Change the owner or/and the group of a file</summary>

`public class func chown(path pPath:String, owner pOwner:String? = nil, group pGroup:String? = nil) -> Bool`

 - Parameters:
   - pPath: Path you want to change the owner or/and the group
   - pOwner: New owner
   - pGroup: New group
 - Returns: `true` if it changed successfully, otherwise return `false`. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Change the current directory</summary>

`public class func chdir(path pPath:String) -> Bool`

 - Parameter:
   - pPath: Path to the target directory
 - Returns: `true` if we can change to the target directory, otherwise return `false`
</details>

<details>
<summary>Create a directory</summary>

`public class func mkdir(path pPath:String, sub pSub:Bool=false) -> Bool`

 - Parameters:
   - pPath: Path of the new directory
   - pSub: `true` will create sub-directory if it's need it, `false` don't create sub-directories and generate an error if they are missing
 - Returns: `true` if the directory is created, otherwise return `false`. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Remove directories, sub-directory and all files under those directories</summary>

`public class func rmdir(path pPath:String) -> Bool`

 BE CAREFUL: This method removes everything in the directory you provide

 - Parameter:
   - pPath: Path to the directory
 - Returns: `true` if the directory is removed, otherwise return `false`
</details>

<details>
<summary>Return working directory name</summary>

`public class func workdir() -> String`

 - Returns: working directory name
</details>

### File attributes methods

<details>
<summary>Size of a file</summary>

`public class func size(file pFile:String) -> UInt64`

 - Parameter:
   - pFile: path to a file
 - Returns: size of the file in bytes or 0 if the doesn't exist or you don't have the right to access it. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Group (POSIX) for a file or a directory</summary>

`public class func group(path pPath:String) -> String?`

 - Parameter:
   - pPath: Path to a file or a directory
 - Returns: group name if the path is valid, otherwise return nil. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Owner (POSIX) for the file or a directory</summary>

`public class func owner(path pPath:String) -> String?`

 - Parameter:
   - pPath: Path to a file or a directory
 - Returns: owner name if the path is valid, otherwise return nil. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Creation date of a file or a directory</summary>

`public class func creation(path pPath:String) -> Date?`

 - Parameter:
   - pPath: Path to a file or a directory
 - Returns: the creation date if the path is valid, otherwise return nil. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Change the creation date of the file's</summary>

`public class func creation(path pPath:String, value pValue:Date) -> Bool`

 - Parameters:
   - pPath: Path you want to change the creation date
   - pValue: New creation date
 - Returns: `true` if it changed successfully, otherwise return `false`. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Modification date of a file or a directory</summary>

`public class func modification(path pPath:String) -> Date?`

 - Parameter:
   - pPath: Path to a file or a directory
 - Returns: the modification date if the path is valid, otherwise return nil. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Change the mdofication date of the file's</summary>

`public class func modification(path pPath:String, value pValue:Date) -> Bool`

 - Parameters:
   - pPath: Path you want to change the mdofication date
   - pValue: New mdofication date
 - Returns: `true` if it changed successfully, otherwise return `false`. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Permission in octal of a file or a directory</summary>

`public class func permissions(path pPath:String) -> Int`

 - Parameter:
   - pPath: Path to a file or a directory
 - Returns: an octal value of the permission if the path is valid, otherwise return 0. If an error occur the variable `error` is set with the error.
</details>

### Read files

<details>
<summary>Read a text file from an URL</summary>

`public class func readText(url pUrl:String) -> String?`

 - Parameter:
   - pUrl: Url in input
 - Returns: the content of the file in a String, otherwise return nil. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Read a text file from a path</summary>

`public class func readText(file pFile:String) -> String?`

 - Parameter:
   - pFile: Path of a text file
 - Returns: the content of the file in a String, otherwise return nil. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Read a text file and split into an array of lines</summary>

`public class func readLines(file pFile:String, seperator pSep:String="") -> [String]?`

 - Parameters:
   - pFile: Path of a text file
   - pSep: Specify the separator. By default "\n".
 - Returns: An array of strings, otherwise return nil. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Read a binary file from an URL</summary>

`public class func readData(url pUrl:String) -> Data?`

 - Parameter:
   - pUrl: Url in input
 - Returns: the content of the file in a Data, otherwise return nil. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Read a binary file from a path</summary>

`public class func readData(file pFile:String) -> Data?`

 - Parameter:
   - pFile: Path of a text file
 - Returns: the content of the file in a Data, otherwise return nil. If an error occur the variable `error` is set with the error.
</details>

### Write files

<details>
<summary>Write a text to a file</summary>

`public class func writeText(file pFile:String, string pString:String, encode pEncode:String.Encoding=String.Encoding.utf8) -> Bool`

 - Parameters:
   - pFile: Path of the file
   - pString: String to store in the file
   - pEncode: Format to encode the string. By default set to utf8.
 - Returns: `true` if the string is saved in the file, otherwise return `false`. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Write lines of text to a file</summary>

`public class func writeText(file pFile:String, lines pLines:[String], seperator pSeparator:String = "", encode pEncode:String.Encoding=String.Encoding.utf8) -> Bool`

 - Parameters:
   - pFile: Path of the file
   - pLines: Array of string to store in the file
   - pEncode: Format to encode the string. By default set to utf8.
 - Returns: `true` if the line is saved in the file, otherwise return `false`. If an error occur the variable `error` is set with the error.
</details>

<details>
<summary>Write a data to a file</summary>

`public class func writeData(file pFile:String, data pData:Data) -> Bool`

   - pFile: Path of the file
   - pData: Data to store in the file
 - Returns: `true` if the data is saved in the file, otherwise return `false`. If an error occur the variable `error` is set with the error.
</details>

