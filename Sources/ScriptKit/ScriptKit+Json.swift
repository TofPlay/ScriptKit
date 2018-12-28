//
//  ScriptKit+Json.swift
//  ScriptKit
//
//  Created by Christophe Braud on 18/06/2017.
//  Base on Tof Templates (https://bit.ly/2OWAgmb)
//  Copyright © 2017 Christophe Braud. All rights reserved.
//

import Foundation

// MARK: -
// MARK: Json extension
// MARK: -
/// ScriptKit extension for Json
public extension ScriptKit {
  // MARK: -
  // MARK: Public access
  // MARK: -
  
  // MARK: -> Public enums
  
  // MARK: -> Public structs
  
  // MARK: -> Public class
  
  // MARK: -> Public type alias 
  
  // MARK: -> Public static properties
  
  // MARK: -> Public properties
  
  // MARK: -> Public class methods
  
  // XT: Dictionary
  
  /// Convert a binary json to a dictionary
  ///
  /// - Parameter:
  ///   - pData: Json in binary form
  /// - Returns: a dictionary. If an error occur the variable `error` is set with the error.
  public class func json2dictionary(_ pData:Data) -> [String:Any] {
    var lRet:[String:Any] = [:]

    if let lArray = json2obj(pData) as? [String:Any] {
      lRet = lArray
    }
    
    return lRet
  }
  
  /// Convert a dictionary to a binary json
  ///
  /// - Parameter:
  ///   - pDictionary: Dictionary to convert
  /// - Returns: a json in binary form
  public class func dictionary2json(_ pDictionary:[String:Any]) -> Data? {
    return obj2json(pDictionary)
  }
  
  /// Convert dictionary to a json string
  ///
  /// - Parameters:
  ///   - pDictionary: Dictionary to convert
  ///   - pFormat: `true` format the json, `false` generate flat json string
  ///   - pPadding: Put the string before each line
  /// - Returns: a json string
  public class func dictionary2strjson(_ pDictionary:[String:Any],format pFormat:Bool = false, padding pPadding:String = "") -> String? {
    return obj2string(pDictionary, format: pFormat, padding: pPadding)
  }
  
  // XT: Array
  
  /// Convert a binary json to an array
  ///
  /// - Parameter:
  ///   - pData: Json in binary form
  /// - Returns: an array of objects. If an error occur the variable `error` is set with the error.
  public class func json2array(_ pData:Data) -> [Any] {
    var lRet:[Any] = []

    if let lArray = json2obj(pData) as? [Any] {
      lRet = lArray
    }
    
    return lRet
  }
  
  /// Convert an array to a binary json
  ///
  /// - Parameter:
  ///   - pArray: Array to convert
  /// - Returns: a binary json. If an error occur the variable `error` is set with the error.
  public class func array2json(_ pArray:[Any]) -> Data? {
    return obj2json(pArray)
  }
  
  /// Convert an array to json string
  ///
  /// - Parameters:
  ///   - pArray: Array to convert
  ///   - pFormat: `true` format the json, `false` generate flat json string
  ///   - pPadding: Put the string before each line
  /// - Returns: a json string. If an error occur the variable `error` is set with the error.
  public class func array2strjson(_ pArray:[Any],format pFormat:Bool = false, padding pPadding:String = "") -> String? {
    return obj2string(pArray, format: pFormat, padding: pPadding)
  }
  
  // XT: Object
  
  /// Convert a binary json to an object
  ///
  /// - Parameter:
  ///   - pData: Binary json
  /// - Returns: an object
  public class func json2obj(_ pData:Data?) -> Any? {
    var lRet:Any? = nil
    
    if let lData = pData {
        do {
          lRet = try JSONSerialization.jsonObject(with: lData, options: .allowFragments)
        } catch let lError {
          self.error = lError
        }
    }
    return lRet
  }
  
  /// Convert an object to a binary json
  ///
  /// - Parameter:
  ///   - pObj: Object
  /// - Returns: a binary json
  public class func obj2json(_ pObj:Any) -> Data? {
    var lRet: Data? = nil
    
    do {
      lRet = try JSONSerialization.data(withJSONObject: pObj, options: JSONSerialization.WritingOptions(rawValue: 0))
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  /// Convert an object to a json string
  ///
  /// - Parameters:
  ///   - pObj: Object to convert
  ///   - pFormat: `true` format the json, `false` generate flat json string
  ///   - pPadding: Put the string before each line
  /// - Returns: a json string
  public class func obj2string(_ pObj:Any, format pFormat:Bool = false, padding pPadding:String = "") -> String? {
    var lRet: String? = nil
    
    let lOptions:JSONSerialization.WritingOptions = pFormat ? .prettyPrinted : JSONSerialization.WritingOptions(rawValue: 0)
    
    do {
      let lData = try JSONSerialization.data(withJSONObject: pObj, options: lOptions)
      
      lRet = String(data: lData, encoding: String.Encoding.utf8)
      
      if pPadding != "" {
        lRet = lRet?.components(separatedBy: "\n").map({ "\(pPadding)\($0)"}).joined(separator: "\n")
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
