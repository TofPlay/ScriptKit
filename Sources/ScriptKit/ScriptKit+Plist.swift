//
//  ScriptKit+Plist.swift
//  XcodeTool
//
//  Created by Christophe Braud on 18/06/2017.
//  Base on Tof Templates (https://goo.gl/GdyFiw)
//  Copyright © 2017 Christophe Braud. All rights reserved.
//

import Foundation

// MARK: -
// MARK: ScriptKit extension
// MARK: -
/// ScriptKit extension for Plist
public  extension ScriptKit {
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
  
  /// Convert a binary plist to a dictionary
  ///
  /// - Parameter:
  ///   - pData: Binary plist
  /// - Returns: a dictonary
  public class func plist2dictionary(_ pData:Data) -> [String:Any] {
    var lRet:[String:Any] = [:]
    
    do {
      lRet = try PropertyListSerialization.propertyList(from: pData, options: [], format: nil) as! [String:Any]
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }

  /// Convert a dictionary to a binary plist
  ///
  /// - Parameters:
  ///   - pDictionary: Dictionary object
  ///   - pFormat: Type of plist you want to generate
  /// - Returns: a binary plist
  public class func dictionary2plist(_ pDictionary:[String:Any], format pFormat:PropertyListSerialization.PropertyListFormat = .xml) -> Data? {
    var lRet:Data? = nil
    
    do {
      lRet = try PropertyListSerialization.data(fromPropertyList: pDictionary, format: pFormat, options: 0)
    } catch let lError {
      self.error = lError
    }
    
    return lRet
  }
  
  // MARK: -> Public init methods
  
  // MARK: -> Public operators
  
  // MARK: -> Public methods
  
  // MARK: -> Public implementation protocol <#protocol name#>
  
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
  
  // MARK: -> Internal implementation protocol <#protocol name#>
  
  // MARK: -
  // MARK: File Private access
  // MARK: -
  
  // MARK: -> File Private enums
  
  // MARK: -> File Private structs
  
  // MARK: -> File Private class
  
  // MARK: -> File Private type alias 

  // MARK: -> File Private static properties

  // MARK: -> File Private properties
  
  // MARK: -> File Private class methods
  
  // MARK: -> File Private init methods
  
  // MARK: -> File Private operators

  // MARK: -> File Private methods

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
