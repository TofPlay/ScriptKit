//
//  ScriptKit+Folder.swift
//  ScriptKit
//
//  Created by Christophe Braud on 11/06/2017.
//  Base on Tof Templates (https://bit.ly/2OWAgmb)
//  Copyright © 2017 Christophe Braud. All rights reserved.
//

import Foundation

// MARK: -
// MARK: Folder extension
// MARK: -
/// ScriptKit extension for folders and files
public extension ScriptKit {
  // MARK: -
  // MARK: Public access
  // MARK: -
  
  // MARK: -> Public enums
  
  // MARK: -> Public structs
  
  // MARK: -> Public class
  
  // MARK: -> Public type alias 
  
  // MARK: -> Public static properties
  
  //XT: Default folders properties
  
  /// Home user directory (~/)
  public static var homeDirectory:String {
    let lRet = NSHomeDirectory() + "/"
    return lRet
  }
  
  /// Temp directory
  public static var tempDirectory:String {
    let lRet = NSTemporaryDirectory()
    return lRet
  }
  
  /// Desktop directory (~/Desktop/)
  public static var desktopDirectory:String {
    var lRet = ""
    do {
      let lUrl =  try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
      lRet = lUrl.path + "/"
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  /// Document directory
  public static var documentDirectory:String {
    var lRet = ""
    do {
      let lUrl =  try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
      lRet = lUrl.path + "/"
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  /// Application support directory (Library/Application Support)
  public static var applicationSupportDirectory:String {
    var lRet = ""
    do {
      let lUrl =  try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
      lRet = lUrl.path + "/"
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  /// Cache directory (Library/Caches)
  public static var cachesDirectory:String {
    var lRet = ""
    do {
      let lUrl =  try FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
      lRet = lUrl.path + "/"
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  // MARK: -> Public properties
  
  // MARK: -> Public class methods
  
  //XT: Check methods
  
  /// Check if the path is a directory
  ///
  /// - Parameter:
  ///   - pPath: Path to check
  /// - Returns: `true` if it's a directory, otherwise `false`
  public class func isDir(_ pPath:String) -> Bool {
    var lIsDir: ObjCBool = false
    let lRet = FileManager.default.fileExists(atPath: pPath, isDirectory: &lIsDir) && lIsDir.boolValue == true
    return lRet
  }
  
  /// Check if the path is a file
  ///
  /// - Parameter:
  ///   - pPath: Path to check
  /// - Returns: `true` if it's a file, otherwise `false`
  public class func isFile(_ pPath:String) -> Bool {
    var lIsDir: ObjCBool = false
    let lRet = FileManager.default.fileExists(atPath: pPath, isDirectory: &lIsDir) && lIsDir.boolValue == false
    return lRet
  }
  
  /// Check if the path is a link
  ///
  /// - Parameter:
  ///   - pPath: Path to check
  /// - Returns: `true` if it's a link, otherwise `false`
  public class func isLink(_ pPath:String) -> Bool {
    let lRet = self.abs(symbolicLink: pPath) != nil
    return lRet
  }
  
  /// Check if the path is an executable
  ///
  /// - Parameter:
  ///   - pPath: Path to check
  /// - Returns: `true` if it's an executable, otherwise `false`
  public class func isExec(_ pPath:String) -> Bool {
    let lRet = FileManager.default.isExecutableFile(atPath: pPath)
    return lRet
  }
  
  /// Check if the path is readable
  ///
  /// - Parameter:
  ///   - pPath: Path to check
  /// - Returns: `true` if it's readable, otherwise `false`
  public class func isRead(_ pPath:String) -> Bool {
    let lRet = FileManager.default.isReadableFile(atPath: pPath)
    return lRet
  }
  
  /// Check if the path is writeable
  ///
  /// - Parameter:
  ///   - pPath: Path to check
  /// - Returns: `true` if it's writeable, otherwise `false`
  public class func isWrite(_ pPath:String) -> Bool {
    let lRet = FileManager.default.isWritableFile(atPath: pPath)
    return lRet
  }
  
  /// Check if we can delete the path
  ///
  /// - Parameter:
  ///   - pPath: Path to check
  /// - Returns: `true` if we can delete the path, otherwise `false`
  public class func isDel(_ pPath:String) -> Bool {
    let lRet = FileManager.default.isDeletableFile(atPath: pPath)
    return lRet
  }
  
  /// Check if the path exist
  ///
  /// - Parameter:
  ///   - pPath: Path to check
  /// - Returns: `true` if the path exist, otherwise `false`
  public class func exist(path pPath: String) -> Bool {
    let lRet = FileManager.default.fileExists(atPath: pPath)
    return lRet
  }
  
  //XT: Link methods
  
  /// Creates a hard link between the items at the specified paths.
  ///
  /// - Parameters:
  ///   - pHard: The path that specifies the item you wish to link to.
  ///   - pPath: The path that identifies the location where the link will be created.
  /// - Returns: `true` if the link is created, otherwise return `false`
  public class func link(hard pHard:String, path pPath:String) -> Bool {
    var lRet = false
    do {
      try FileManager.default.linkItem(atPath:pPath , toPath: pHard)
      lRet = true
    } catch let lError {
      self.error = lError
    }
    return lRet
  }
  
  /// Creates a symbolic link that points to the specified destination.
  ///
  /// - Parameters:
  ///   - pSymbolic: The path at which to create the new symbolic link. The last path component is used as the name of the link.
  ///   - pPath: The path that contains the item to be pointed to by the link. In other words, this is the destination of the link.
  /// - Returns: `true` if the link is created, otherwise return `false`
  public class func link(symbolic pSymbolic:String, path pPath:String) -> Bool {
    var lRet = false
    do {
      try FileManager.default.createSymbolicLink(atPath: pSymbolic, withDestinationPath: pPath)
      lRet = true
    } catch let lError {
      self.error = lError
    }
    return lRet
  }
  
  //XT: Path methods
  
  /// Returns the path of the item pointed to by a symbolic link.
  ///
  /// - Parameter:
  ///   - pSymbolicLink: Path to a symbolic link
  /// - Returns: Returns the path of the item pointed to by a symbolic link.
  public class func abs(symbolicLink pSymbolicLink:String) -> String? {
    var lRet:String? = nil
    do {
      lRet = try FileManager.default.destinationOfSymbolicLink(atPath: pSymbolicLink)
    } catch let lError {
      self.error = lError
    }
    return lRet
  }
 
  /// Convert a relative path to an absolute path
  ///
  /// - Parameter:
  ///   - pPath: Any path
  /// - Returns: an absolute path
  public class func abs(path pPath:String) -> String {
    var lRet = norm(path: pPath)
    
    if lRet.first != "/" {
      lRet = norm(path: workdir() + lRet)
    }
    
    return lRet
  }
  
  /// Normalized the path
  ///
  /// - Parameter:
  ///   - pPath: Any path
  /// - Returns: a path normalized
  public class func norm(path pPath:String) -> String {
    var lRet = (pPath as NSString).standardizingPath
    
    if isDir(lRet) && lRet.last != "/" {
      lRet += "/"
    }
    
    return lRet
  }
  
  /// Extract the directory of a path
  ///
  /// For example:
  /// ```
  ///  print(dir(path: "/Users/JohnDoe/notes.txt"))
  /// ```
  ///  Will diplayed:
  ///  ```
  ///  /Users/JohnDoe
  ///  ```
  /// - Parameter:
  ///   - pPath: Any path
  /// - Returns: the directory
  public class func dir(path pPath:String) -> String {
    var lRet = pPath.trimEnd("/").withoutLastWord("/").unwrappedOr(default: "")
    
    if pPath.hasPrefix(lRet + "/") {
      lRet += "/"
    }
    return lRet
  }
  
  /// Extract the file name + extension of a path
  ///
  /// For example:
  /// ```
  ///  print(name(path: "/Users/JohnDoe/notes.txt"))
  /// ```
  ///  Will diplayed:
  ///  ```
  ///  notes.txt
  ///  ```
  /// - Parameter:
  ///   - pPath: Any path
  /// - Returns: the file name
  public class func fullname(path pPath:String) -> String {
    let lRet = pPath.trimEnd("/").lastWord("/").unwrappedOr(default: pPath)
    return lRet
  }
  
  /// Extract the file name of a path
  ///
  /// For example:
  /// ```
  ///  print(name(path: "/Users/JohnDoe/notes.txt"))
  /// ```
  ///  Will diplayed:
  ///  ```
  ///  notes
  ///  ```
  /// - Parameter:
  ///   - pPath: Any path
  /// - Returns: the file name
  public class func name(path pPath:String) -> String {
    let lFullName = fullname(path:pPath)
    let lRet = lFullName.trimEnd("/").withoutLastWord("\\.").unwrappedOr(default: lFullName)
    return lRet
  }
  
  /// Extract the extension of a path
  ///
  /// For example:
  /// ```
  ///  print(ext(path: "/Users/JohnDoe/notes.txt"))
  /// ```
  ///  Will diplayed:
  ///  ```
  ///  txt
  ///  ```
  /// - Parameter:
  ///   - pPath: Any path
  /// - Returns: the extension
  public class func ext(path pPath:String) -> String {
    let lFullName = fullname(path:pPath)
    let lRet = lFullName.trimEnd("/").lastWord("\\.").unwrappedOr(default: "")
    return lRet
  }
  
  //XT: List methods
  
  /// Finds all the pathnames matching a specified pattern
  ///
  /// The pattern is define as a directory path follow by a regular expresion.
  ///
  /// For example:
  /// ```
  ///  glob("/Users/JohnDoe/Documents/bill[0-9]*\\..*")
  /// ```
  ///  Will return:
  ///  ```
  ///  /User/JohnDoe/Documents/bill2014/
  ///  /User/JohnDoe/Documents/bill2015/
  ///  /User/JohnDoe/Documents/bill2016/
  ///  /User/JohnDoe/Documents/bill001.pdf
  ///  /User/JohnDoe/Documents/bill002.pdf
  ///  /User/JohnDoe/Documents/bill003.pdf
  ///  ...
  ///  ```
  /// - Parameters:
  ///   - pPath: Direcotry path + the RegEx
  ///   - pRecursive: `true` will search on sub-directory, `false` search only on the directory path
  ///   - pAbsPath: `true` return the fullpath for each item, `false` return juste the directory path for each item
  /// - Returns: an Array with all files and directory that match the RegEx
  public class func glob(path pPath:String, recursive pRecursive:Bool = false, absPath pAbsPath:Bool = false) -> [String] {
    var lRet:[String] = []
    
    do {
      let lDir = isDir(pPath)
      var lPath = ""
      var lRegEx = ""
      
      if lDir == true {
        lPath = norm(path: pPath)
        lRegEx = ".*"
      } else {
        lPath = dir(path: pPath)
        lRegEx = fullname(path: pPath)
        if lPath.isEmpty {
          lPath = "./"
        }
      }
      
      let lItems = try FileManager.default.contentsOfDirectory(atPath: lPath).sorted(by: {
        pVal1, pVal2 in
        
        var lRet = false
        
        if isDir(pVal1) && isDir(pVal2) {
          if pVal1.count < pVal2.count {
            lRet = true
          } else if pVal1.count > pVal2.count {
            lRet = false
          } else {
            lRet = pVal1 < pVal2
          }
        } else if isDir(pVal1) && !isDir(pVal2) {
          lRet = true
        } else if !isDir(pVal1) && isDir(pVal2) {
          lRet = false
        } else {
          if pVal1.count < pVal2.count {
            lRet = true
          } else if pVal1.count > pVal2.count {
            lRet = false
          } else {
            lRet = pVal1 < pVal2
          }
        }
        
        return lRet
      })
      
      if (lDir == true || lRegEx == ".*") && pRecursive == false && pAbsPath == false {
        lRet = lItems.map {
          lItem in
          
          var lRet = lPath + lItem
          
          if isDir(lRet) && lRet.last != "/" {
            lRet += "/"
          }
          
          return lRet
        }
      } else {
        for lItem in lItems {
          var lPathItem = pAbsPath == true ? abs(path: lPath + lItem) : norm(path: lPath + lItem)
          
          if isDir(lPathItem) && lPathItem.last != "/" {
            lPathItem += "/"
          }
          
          if lItem.match(regEx: lRegEx) {
            lRet.append(lPathItem)
          }
          
          if pRecursive == true && isDir(lPathItem) {
            lRet.append(contentsOf: glob(path: lPathItem + lRegEx, recursive: true, absPath: false))
          }
        }
      }
    } catch let lError {
      self.error = lError
    }
    return lRet
  }

  //XT: Tools methods
  
  /// Simulate `whereis` instruction
  ///
  /// Extract paths from PATH and check if a program exist on these paths
  ///
  /// - Parameter:
  ///   - pName: Program name
  /// - Returns: full path of the program if exist, otherwise return `nil`
  public class func whereis(_ pName:String) -> String? {
    var lRet:String? = nil
    if let lPaths = ScriptKit.env["PATH"]?.components(separatedBy: ":") {
      for lPath in lPaths {
        let lFullName = norm(path: lPath + "/" + pName)
        if exist(path: lFullName) {
          lRet = lFullName
          break
        }
      }
    }
    return lRet
  }
  
  //XT: Handles methods
  
  /// Copy a path to another path
  ///
  /// - Parameters:
  ///   - pPath: Original path
  ///   - pTo: Target path
  /// - Returns: `true` unable to copy the original to the target path, otherwise return `false`. If an error occur the variable `error` is set with the error.
  @discardableResult
  public class func cp(path pPath:String, to pTo:String, overwrite pOverwrite:Bool = false) -> Bool {
    var lRet = false
    
    if pOverwrite {
      if isDir(pTo) {
        rmdir(path: pTo)
      } else {
        rm(path: pTo)
      }
    }
    
    do {
      try FileManager.default.copyItem(atPath: pPath, toPath: pTo)
      lRet = true
    } catch let lError {
      self.error = lError
    }
    return lRet
  }
  
  /// Remove a path
  ///
  /// Could be a file or an empty directory
  ///
  /// - Parameter:
  ///   - pPath: Path to remove
  /// - Returns: `true` the path is removed, otherwise return `false`. If an error occur the variable `error` is set with the error.
  @discardableResult
  public class func rm(path pPath:String) -> Bool {
    var lRet = false
    do {
      try FileManager.default.removeItem(atPath: pPath)
      lRet = true
    } catch let lError {
      self.error = lError
    }
    return lRet
  }
  
  /// Move a file or a directory
  ///
  /// - Parameters:
  ///   - pAt: Original file or directory
  ///   - pTo: Target path
  /// - Returns: `true` the path is moved, otherwise return `false`. If an error occur the variable `error` is set with the error.
  @discardableResult
  public class func mv(at pAt:String, to pTo:String, overwrite pOverwrite:Bool = false) -> Bool {
    var lRet = false

    if pOverwrite {
      if isDir(pTo) {
        rmdir(path: pTo)
      } else {
        rm(path: pTo)
      }
    }
    
    do {
      try FileManager.default.moveItem(atPath: pAt, toPath: pTo)
      lRet = true
    } catch let lError {
      self.error = lError
    }
    return lRet
  }
  
  /// Change the permission of the file's
  ///
  /// - Parameters:
  ///   - pPath: Path you want to change the permission
  ///   - pValue: New mdofication the permission. Must be an octal value.
  /// - Returns: `true` if it changed successfully, otherwise return `false`. If an error occur the variable `error` is set with the error.
  @discardableResult
  public class func chmod(path pPath:String, value pValue:Int) -> Bool {
    var lRet = false
    
    do {
      if let lValue:Int = Int(String(pValue), radix: 8) {
        try FileManager.default.setAttributes([.posixPermissions: lValue], ofItemAtPath: pPath)
        lRet = true
      } else {
        self.scriptError = .folder("Invalid permission")
      }
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  /// Change the owner or/and the group of a file
  ///
  /// - Parameters:
  ///   - pPath: Path you want to change the owner or/and the group
  ///   - pOwner: New owner
  ///   - pGroup: New group
  /// - Returns: `true` if it changed successfully, otherwise return `false`. If an error occur the variable `error` is set with the error.
  @discardableResult
  public class func chown(path pPath:String, owner pOwner:String? = nil, group pGroup:String? = nil) -> Bool {
    var lRet = false
    
    if pOwner == nil && pGroup == nil {
      self.scriptError = .folder("You must provide the owner or the group")
    } else {
      do {
        if let lOwner = pOwner {
          try FileManager.default.setAttributes([.ownerAccountName: lOwner], ofItemAtPath: pPath)
        }
        
        if let lGroup = pGroup {
          try FileManager.default.setAttributes([.groupOwnerAccountName: lGroup], ofItemAtPath: pPath)
        }
        
        lRet = true
      } catch let lError {
        self.error = lError
      }
    }
    
    return lRet
  }
  
  /// Change the current directory
  ///
  /// - Parameter:
  ///   - pPath: Path to the target directory
  /// - Returns: `true` if we can change to the target directory, otherwise return `false`
  @discardableResult
  public class func chdir(path pPath:String) -> Bool {
    let lRet = FileManager.default.changeCurrentDirectoryPath(pPath)
    return lRet
  }
  
  /// Create a directory
  ///
  /// - Parameters:
  ///   - pPath: Path of the new directory
  ///   - pSub: `true` will create sub-directory if it's need it, `false` don't create sub-directories and generate an error if they are missing
  /// - Returns: `true` if the directory is created, otherwise return `false`. If an error occur the variable `error` is set with the error.
  @discardableResult
  public class func mkdir(path pPath:String, sub pSub:Bool=false) -> Bool {
    var lRet = false
    do {
      try FileManager.default.createDirectory(atPath: pPath, withIntermediateDirectories: pSub, attributes: nil)
      lRet = true
    } catch let lError {
      self.error = lError
    }
    return lRet
  }
  
  /// Remove directories, sub-directory and all files under those directories
  ///
  /// BE CAREFUL: This method removes everything in the directory you provide
  ///
  /// - Parameter:
  ///   - pPath: Path to the directory
  /// - Returns: `true` if the directory is removed, otherwise return `false`
  @discardableResult
  public class func rmdir(path pPath:String) -> Bool {
    var lRet = true
    let lFolder = norm(path: pPath)
    
    if isDir(lFolder) == false {
      lRet = false
    } else {
      for lItem in glob(path: lFolder) where lRet == true {
        if isFile(lItem) || isLink(lItem) {
          lRet = rm(path: lItem)
        } else if isDir(lItem) {
          lRet = rmdir(path: lItem)
        }
      }
      if lRet == true {
        lRet = rm(path: lFolder)
      }
    }
   
    return lRet
  }
  
  /// Return working directory name
  ///
  /// - Returns: working directory name
  public class func workdir() -> String {
    let lRet = FileManager.default.currentDirectoryPath + "/"
    return lRet
  }
  
  //XT: File attributes methods
  
  /// Size of a file
  ///
  /// - Parameter:
  ///   - pFile: path to a file
  /// - Returns: size of the file in bytes or 0 if the doesn't exist or you don't have the right to access it. If an error occur the variable `error` is set with the error.
  public class func size(file pFile:String) -> UInt64 {
    var lRet:UInt64 = 0
    
    if isFile(pFile) {
      do {
        let lAttributs = try FileManager.default.attributesOfItem(atPath: pFile)
        lRet = (lAttributs as NSDictionary).fileSize()
      } catch let lError {
        self.error = lError
      }
    }
    
    return lRet
  }
  
  /// Group (POSIX) for a file or a directory
  ///
  /// - Parameter:
  ///   - pPath: Path to a file or a directory
  /// - Returns: group name if the path is valid, otherwise return nil. If an error occur the variable `error` is set with the error.
  public class func group(path pPath:String) -> String? {
    var lRet:String? = nil
    
    do {
      let lAttributs = try FileManager.default.attributesOfItem(atPath: pPath)
      lRet = (lAttributs as NSDictionary).fileGroupOwnerAccountName()
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  /// Owner (POSIX) for the file or a directory
  ///
  /// - Parameter:
  ///   - pPath: Path to a file or a directory
  /// - Returns: owner name if the path is valid, otherwise return nil. If an error occur the variable `error` is set with the error.
  public class func owner(path pPath:String) -> String? {
    var lRet:String? = nil
    
    do {
      let lAttributs = try FileManager.default.attributesOfItem(atPath: pPath)
      lRet = (lAttributs as NSDictionary).fileOwnerAccountName()
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  /// Creation date of a file or a directory
  ///
  /// - Parameter:
  ///   - pPath: Path to a file or a directory
  /// - Returns: the creation date if the path is valid, otherwise return nil. If an error occur the variable `error` is set with the error.
  public class func creation(path pPath:String) -> Date? {
    var lRet:Date? = nil
    
    do {
      let lAttributs = try FileManager.default.attributesOfItem(atPath: pPath)
      lRet = (lAttributs as NSDictionary).fileCreationDate()
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  /// Change the creation date of the file's
  ///
  /// - Parameters:
  ///   - pPath: Path you want to change the creation date
  ///   - pValue: New creation date
  /// - Returns: `true` if it changed successfully, otherwise return `false`. If an error occur the variable `error` is set with the error.
  public class func creation(path pPath:String, value pValue:Date) -> Bool {
    var lRet = false
    
    do {
      try FileManager.default.setAttributes([.creationDate: pValue], ofItemAtPath: pPath)
      lRet = true
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  /// Modification date of a file or a directory
  ///
  /// - Parameter:
  ///   - pPath: Path to a file or a directory
  /// - Returns: the modification date if the path is valid, otherwise return nil. If an error occur the variable `error` is set with the error.
  public class func modification(path pPath:String) -> Date? {
    var lRet:Date? = nil
    
    do {
      let lAttributs = try FileManager.default.attributesOfItem(atPath: pPath)
      lRet = (lAttributs as NSDictionary).fileModificationDate()
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  /// Change the mdofication date of the file's
  ///
  /// - Parameters:
  ///   - pPath: Path you want to change the mdofication date
  ///   - pValue: New mdofication date
  /// - Returns: `true` if it changed successfully, otherwise return `false`. If an error occur the variable `error` is set with the error.
  public class func modification(path pPath:String, value pValue:Date) -> Bool {
    var lRet = false
    
    do {
      try FileManager.default.setAttributes([.modificationDate: pValue], ofItemAtPath: pPath)
      lRet = true
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  /// Permission in octal of a file or a directory
  ///
  /// - Parameter:
  ///   - pPath: Path to a file or a directory
  /// - Returns: an octal value of the permission if the path is valid, otherwise return 0. If an error occur the variable `error` is set with the error.
  public class func permissions(path pPath:String) -> Int {
    var lRet:Int = 0
    
    do {
      let lAttributs = try FileManager.default.attributesOfItem(atPath: pPath)
      lRet = (lAttributs as NSDictionary).filePosixPermissions()
      lRet = Int(String(lRet, radix: 8)).unwrappedOr(default: 0) 
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  //XT: Read files
  
  /// Read a text file from an URL
  ///
  /// - Parameter:
  ///   - pUrl: Url in input
  /// - Returns: the content of the file in a String, otherwise return nil. If an error occur the variable `error` is set with the error.
  public class func readText(url pUrl:String) -> String? {
    var lRet:String? = nil
    
    if let lUrl = URL(string: pUrl) {
      do {
        lRet = try String(contentsOf: lUrl, encoding: String.Encoding.utf8)
      } catch let lError {
        self.error = lError
      }
    } else {
      self.scriptError = .folder("Error: Invalid url")
    }
    return lRet
  }
  
  /// Read a text file from a path
  ///
  /// - Parameter:
  ///   - pFile: Path of a text file
  /// - Returns: the content of the file in a String, otherwise return nil. If an error occur the variable `error` is set with the error.
  public class func readText(file pFile:String) -> String? {
    var lRet:String? = nil
    
    do {
      lRet = try String(contentsOfFile: pFile)
    } catch let lError {
      self.error = lError
    }
    return lRet
  }
  
  /// Read a text file and split into an array of lines
  ///
  /// - Parameters:
  ///   - pFile: Path of a text file
  ///   - pSep: Specify the separator. By default "\n".
  /// - Returns: An array of strings, otherwise return nil. If an error occur the variable `error` is set with the error.
  public class func readLines(file pFile:String, seperator pSep:String="\n") -> [String]? {
    var lRet:[String]? = nil
    if let lContent = self.readText(file: pFile) {
      lRet = lContent.components(separatedBy: CharacterSet.init(charactersIn: pSep))
    }
    return lRet
  }

  /// Read a binary file from an URL
  ///
  /// - Parameter:
  ///   - pUrl: Url in input
  /// - Returns: the content of the file in a Data, otherwise return nil. If an error occur the variable `error` is set with the error.
  public class func readData(url pUrl:String) -> Data? {
    var lRet:Data? = nil
    do {
      if let lUrl = URL(string: pUrl) {
        lRet = try Data(contentsOf: lUrl)
      }
    } catch let lError {
      self.error = lError
    }
    return lRet
  }

  /// Read a binary file from a path
  ///
  /// - Parameter:
  ///   - pFile: Path of a text file
  /// - Returns: the content of the file in a Data, otherwise return nil. If an error occur the variable `error` is set with the error.
  public class func readData(file pFile:String) -> Data? {
    var lRet:Data? = nil
      
    if let lFile = FileHandle(forReadingAtPath: pFile) {
      lRet = lFile.readDataToEndOfFile()
    } else {
      self.scriptError = .folder("Error: Unable to read data from file '\(pFile)'")
    }
    
    return lRet
  }
  
  /// Read a json file from an URL
  ///
  /// - Parameter:
  ///   - pUrl: Url in input
  /// - Returns: object specify, otherwise return nil. If an error occur the variable `error` is set with the error.
  public class func readJson<T:Decodable>(codable pCodable: T.Type, url pUrl:String) -> T? {
    var lRet:T? = nil
    
    do {
      if let lUrl = URL(string: pUrl) {
        let lData = try Data(contentsOf: lUrl)
        lRet = try JSONDecoder().decode(T.self, from: lData)
      }
    } catch let lError {
      self.error = lError
    }
    return lRet
  }
  
  /// Read a json file from a path
  ///
  /// - Parameter:
  ///   - pFile: Path of a text file
  /// - Returns: object specify, otherwise return nil. If an error occur the variable `error` is set with the error.
  public class func readJson<T:Decodable>(codable pCodable: T.Type, file pFile:String) -> T? {
    var lRet:T? = nil
    
    do {
      if let lFile = FileHandle(forReadingAtPath: pFile) {
        let lData = lFile.readDataToEndOfFile()
        lRet = try JSONDecoder().decode(T.self, from: lData)
      } else {
        self.scriptError = .folder("Error: Unable to read data from file '\(pFile)'")
      }
    } catch let lError {
      self.error = lError
    }

    return lRet
  }

  /// Read a plist file from an URL
  ///
  /// - Parameter:
  ///   - pUrl: Url in input
  /// - Returns: object specify, otherwise return nil. If an error occur the variable `error` is set with the error.
  public class func readPlist<T:Decodable>(codable pCodable: T.Type, url pUrl:String) -> T? {
    var lRet:T? = nil
    
    do {
      if let lUrl = URL(string: pUrl) {
        let lData = try Data(contentsOf: lUrl)
        lRet = try PropertyListDecoder().decode(T.self, from: lData)
      }
    } catch let lError {
      self.error = lError
    }
    return lRet
  }
  
  /// Read a json file from a path
  ///
  /// - Parameter:
  ///   - pFile: Path of a text file
  /// - Returns: object specify, otherwise return nil. If an error occur the variable `error` is set with the error.
  public class func readPlist<T:Decodable>(codable pCodable: T.Type, file pFile:String) -> T? {
    var lRet:T? = nil
    
    do {
      if let lFile = FileHandle(forReadingAtPath: pFile) {
        let lData = lFile.readDataToEndOfFile()
        lRet = try PropertyListDecoder().decode(T.self, from: lData)
      } else {
        self.scriptError = .folder("Error: Unable to read data from file '\(pFile)'")
      }
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  //XT: Write files
  
  /// Write a text to a file
  ///
  /// - Parameters:
  ///   - pFile: Path of the file
  ///   - pString: String to store in the file
  ///   - pEncode: Format to encode the string. By default set to utf8.
  /// - Returns: `true` if the string is saved in the file, otherwise return `false`. If an error occur the variable `error` is set with the error.
  @discardableResult
  public class func writeText(file pFile:String, string pString:String, encode pEncode:String.Encoding=String.Encoding.utf8) -> Bool {
    var lRet = false

    if let lData = pString.data(using: pEncode) {
      lRet = writeData(file: pFile, data: lData)
    } else {
      self.scriptError = .folder("Error: Unable to save string to file '\(pFile)'")
    }
    return lRet
  }
  
  /// Write lines of text to a file
  ///
  /// - Parameters:
  ///   - pFile: Path of the file
  ///   - pLines: Array of string to store in the file
  ///   - pEncode: Format to encode the string. By default set to utf8.
  /// - Returns: `true` if the line is saved in the file, otherwise return `false`. If an error occur the variable `error` is set with the error.
  @discardableResult
  public class func writeText(file pFile:String, lines pLines:[String], seperator pSeparator:String = "\n", encode pEncode:String.Encoding=String.Encoding.utf8) -> Bool {
    var lRet = false
    let lString = pLines.joined(separator: pSeparator)
    
    if let lData = lString.data(using: pEncode) {
      lRet = writeData(file: pFile, data: lData)
    } else {
      self.scriptError = .folder("Error: Unable to save lines to file '\(pFile)'")
    }
    return lRet
  }
  
  /// Write a data to a file
  ///
  ///   - pFile: Path of the file
  ///   - pData: Data to store in the file
  /// - Returns: `true` if the data is saved in the file, otherwise return `false`. If an error occur the variable `error` is set with the error.
  @discardableResult
  public class func writeData(file pFile:String, data pData:Data) -> Bool {
    var lRet = false
    
    if exist(path: pFile) == false {
      lRet = FileManager.default.createFile(atPath: pFile, contents: pData, attributes: nil)
    } else if let lFile = FileHandle(forUpdatingAtPath: pFile) {
      lFile.truncateFile(atOffset: 0)
      lFile.write(pData)
      lRet = true
    }
    
    if lRet == false {
      self.scriptError = .folder("Error: Unable to save data to file '\(pFile)'")
    }
    
    return lRet
  }

  /// Write an object to a json file
  ///
  ///   - pFile: Path of the file
  ///   - pObject: Encodable object
  /// - Returns: `true` if the object is saved in the file, otherwise return `false`. If an error occur the variable `error` is set with the error.
  @discardableResult
  public class func writeJson<T:Encodable>(file pFile:String, object pObject:T) -> Bool {
    var lRet = false
    
    do {
      let lData = try JSONEncoder().encode(pObject)

      if exist(path: pFile) == false {
        lRet = FileManager.default.createFile(atPath: pFile, contents: lData, attributes: nil)
      } else if let lFile = FileHandle(forUpdatingAtPath: pFile) {
        lFile.truncateFile(atOffset: 0)
        lFile.write(lData)
        lRet = true
      }
      
      if lRet == false {
        self.scriptError = .folder("Error: Unable to save data to file '\(pFile)'")
      }
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  /// Write an object to a plist file
  ///
  ///   - pFile: Path of the file
  ///   - pObject: Encodable object
  /// - Returns: `true` if the object is saved in the file, otherwise return `false`. If an error occur the variable `error` is set with the error.
  @discardableResult
  public class func writePlist<T:Encodable>(file pFile:String, object pObject:T) -> Bool {
    var lRet = false
    
    do {
      let lData = try PropertyListEncoder().encode(pObject)
      
      if exist(path: pFile) == false {
        lRet = FileManager.default.createFile(atPath: pFile, contents: lData, attributes: nil)
      } else if let lFile = FileHandle(forUpdatingAtPath: pFile) {
        lFile.truncateFile(atOffset: 0)
        lFile.write(lData)
        lRet = true
      }
      
      if lRet == false {
        self.scriptError = .folder("Error: Unable to save data to file '\(pFile)'")
      }
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  // MARK: -> Public init methods
  
  // MARK: -> Public operators

  // MARK: -> Public methods
  
  // MARK: -
  // MARK: Internal access (aka public for current module)
  // MARK: -
  
  // MARK: -> Internal enums
  
  // MARK: -> Internal structs
  
  // MARK: -> Internal class
  
  // MARK: -> Internal type alias
  
  // MARK: -> Internal static properties
  
  // MARK: -> Internal properties
  
  // MARK: -> Internal class methods
  
  
  // MARK: -> Internal init methods
  
  // MARK: -> Internal operators

  // MARK: -> Internal methods
  
  // MARK: -
  // MARK: Private access
  // MARK: -
  
  // MARK: -> Private enums
  
  // MARK: -> Private structs
  
  // MARK: -> Private class
  
  // MARK: -> Private type alias 

  // MARK: -> Private static properties

  // MARK: -> Private properties

  // MARK: -> Private class methods
  
  // MARK: -> Private init methods
  
  // MARK: -> Private operators

  // MARK: -> Private methods
}
