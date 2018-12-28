//
//  Optional+ScriptKit.swift
//  XcodeTool
//
//  Created by Christophe Braud on 18/12/2018.
//  Base on Tof Templates (https://bit.ly/2OWAgmb)
//
//

import Foundation

// MARK: -
// MARK: Optional
// MARK: -
extension Optional {
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
  
  // MARK: -> Public init methods
  
  // MARK: -> Public operators
  
  // MARK: -> Public methods
  
  public func unwrapped<T>(cast pCast:T.Type, action pAction:(T)->Wrapped, default pDefault: Wrapped) -> Wrapped {
    if let lValue = self as? T {
      return pAction(lValue)
    } else if let lValue = self {
      return lValue
    } else {
      return pDefault
    }
  }
  
  public func unwrapped<T,V>(cast pCast:T.Type, action pAction:(T)->V, default pDefault: V) -> V {
    guard let lValue = self as? T else {
      return pDefault
    }
    
    return pAction(lValue)
  }
  
  public func unwrapped<V>(_ pAction:(Wrapped)->V, default pDefault: V) -> V {
    guard let lValue = self else {
      return pDefault
    }
    
    return pAction(lValue)
  }
  
  public func unwrappedOr(default pDefault:Wrapped) -> Wrapped {
    guard let lValue = self else {
      return pDefault
    }
    
    return lValue
  }
  
  @discardableResult
  public func unwrapped(_ pAction:(Wrapped)->Void) -> Bool {
    guard let lValue = self else {
      return false
    }
    
    pAction(lValue)
    
    return true
  }
  
  public mutating func set(ifNil pDefault:Wrapped) {
    if self == nil {
      self = pDefault
    }
  }
  
  public mutating func remove<T:Comparable>(_ pValue:T) {
    if Wrapped.self is Array<T>.Type {
      if self == nil {
        self = [pValue] as? Wrapped
      } else if var lArray = self as? Array<T> {
        if let lIndex = lArray.firstIndex(where: {$0 == pValue}) {
          lArray.remove(at: lIndex)
          self = lArray as? Wrapped
        }
      }
    }
  }
  
  public mutating func append<T>(_ pValue:T) {
    if Wrapped.self is Array<T>.Type {
      if self == nil {
        self = [pValue] as? Wrapped
      } else if var lArray = self as? Array<T> {
        lArray.append(pValue)
        self = lArray as? Wrapped
      }
    }
  }
  
  public mutating func set<KEY:Hashable,VALUE>(key pKey:KEY, value pValue:VALUE) {
    if Wrapped.self is Dictionary<KEY, VALUE>.Type {
      if self == nil {
        self = [pKey:pValue] as? Wrapped
      } else if var lDict = self as? Dictionary<KEY, VALUE> {
        lDict[pKey] = pValue
        self = lDict as? Wrapped
      }
    }
  }
  
  // MARK: -
  // MARK: Internal access (aka public for current module)
  // MARK: -
  
  // MARK: -> Internal enums
  
  // MARK: -> Internal structs
  
  // MARK: -> Internal class
  
  // MARK: -> Internal type alias
  
  // MARK: -> Internal static properties
  
  // MARK: -> Internal class methods
  
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

