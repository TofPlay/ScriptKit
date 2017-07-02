//
//  ScriptKit.swift
//  ScriptKit
//
//  Created by Christophe Braud on 11/06/2017.
//  Base on Tof Templates (https://goo.gl/GdyFiw)
//  Copyright © 2017 Christophe Braud. All rights reserved.
//

import Foundation

/// Class ScriptKit
open class ScriptKit {
  // MARK: -
  // MARK: Public access
  // MARK: -
  
  // MARK: -> Public enums
  
  /// Manager internal error of ScriptKit
  ///
  /// - noerror: No error detected
  /// - cmd: Error on command methods
  /// - folder: Error on folder methods
  public enum ScriptError : Error, Equatable, CustomStringConvertible {
    case noerror
    case cmd(String)
    case folder(String)
   
    public var description: String {
      switch self {
      case .noerror:
        return "noerror"
      case .cmd(let lError):
        return "cmd(\"\(lError)\")"
      case .folder(let lError):
        return "folder(\"\(lError)\")"
      }
    }
    
    public static func == (pLhs: ScriptError, pRhs: ScriptError) -> Bool {
      var lRet:Bool = false
      
      switch pLhs {
      case .noerror:
        lRet = pRhs.description == "noerror"
      case .cmd(let lVal1):
        if case .cmd(let lVal2) = pRhs, lVal1 == lVal2 { lRet = true }
      case .folder(let lVal1):
        if case .folder(let lVal2) = pRhs, lVal1 == lVal2 { lRet = true }
      }
      
      return lRet
    }
    
    public static func == (pLhs: Error, pRhs: ScriptError) -> Bool {
      var lRet:Bool = false
      
      if let lLhs = pLhs as? ScriptError, lLhs == pRhs {
        lRet = true
      }
      
      return lRet
    }
    
  }
  
  // MARK: -> Public structs
  
  // MARK: -> Public class
  
  // MARK: -> Public type alias
  
  // MARK: -> Public static properties
  
  // MARK: -> Public properties
  
  // MARK: -> Public class methods
  
  // MARK: -> Public init methods
  
  // MARK: -> Public operators
  
  // MARK: -> Public methods
  
  // MARK: -> Public class override Mappable
  
  // MARK: -> Public implementation protocol <#protocol name#>
  
  // MARK: -
  // MARK: Internal access (aka public for current module)
  // MARK: -
  
  // MARK: -> Internal enums
  
  // MARK: -> Internal structs
  
  // MARK: -> Internal class
  
  /// Alias to `error` to store and manipulate ScriptKit errors
  internal static var scriptError:ScriptError {
    set(pError) {
      self.error = pError
    }
    get {
      var lRet:ScriptError = .noerror

      if let lError = self.error as? ScriptError {
        lRet = lError
      }
      
      return lRet
    }
  }
  
  // MARK: -> Internal type alias
  
  // MARK: -> Internal static properties
  
  // MARK: --> Command + Option
  
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
  
  // MARK: --> Command + Option

  // MARK: -> Private type alias
  
  // MARK: -> Private static properties
  
  // MARK: -> Private properties
  
  // MARK: -> Private class methods
  
  // MARK: -> Private init methods
  
  // MARK: -> Private operators
  
  // MARK: -> Private methods
  
}
