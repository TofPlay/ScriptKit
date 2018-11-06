//
//  ScriptKit+Ansi.swift
//  ScriptKit
//
//  Created by Christophe Braud on 11/06/2017.
//  Base on Tof Templates (https://bit.ly/2OWAgmb)
//  Copyright © 2017 Christophe Braud. All rights reserved.
//

import Foundation

// MARK: -
// MARK: ANSI extension
// MARK: -
/// ScriptKit extension for ANSI codes
public extension ScriptKit {
  // MARK: -
  // MARK: Public access
  // MARK: -
  
  // MARK: -> Public enums
  
  /// Main ANSI sequences
  public enum Ansi: CustomStringConvertible {
    case esc
    case reset     
    case bright    
    case dim       
    case underscore
    case blink     
    case reverse   
    case hidden    
    
    public var description:String {
      switch self {
      case .esc:
        return "\u{001B}"
      case .reset:
        return "\u{001B}[0m"
      case .bright:
        return "\u{001B}[1m"
      case .dim:
        return "\u{001B}[2m"
      case .underscore:
        return "\u{001B}[4m"
      case .blink:
        return "\u{001B}[5m"
      case .reverse:
        return "\u{001B}[7m"
      case .hidden:
        return "\u{001B}[8m"
      }
    }

    /// Forground colors ANSI sequences
    public enum Fg: CustomStringConvertible {
      case black
      case red
      case green
      case yellow
      case blue
      case magenta
      case cyan
      case white
      case c256(Int)
      
      public var description:String {
        switch self {
        case .black:
          return "\u{001B}[30m"
        case .red:
          return "\u{001B}[31m"
        case .green:
          return "\u{001B}[32m"
        case .yellow:
          return "\u{001B}[33m"
        case .blue:
          return "\u{001B}[34m"
        case .magenta:
          return "\u{001B}[35m"
        case .cyan:
          return "\u{001B}[36m"
        case .white:
          return "\u{001B}[37m"
        case .c256(let lColor):
          // color table available here: http://misc.flogisoft.com/bash/tip_colors_and_formatting
          return "\u{001B}[38;5;\(lColor)m"
        }
      }
    }
    
    /// Background colors ANSI sequences
    public enum Bg: CustomStringConvertible {
      case black  
      case red    
      case green  
      case yellow 
      case blue   
      case magenta
      case cyan   
      case white
      case c256(Int)
      
      public var description:String {
        switch self {
        case .black:
          return "\u{001B}[40m"
        case .red:
          return "\u{001B}[41m"
        case .green:
          return "\u{001B}[42m"
        case .yellow:
          return "\u{001B}[43m"
        case .blue:
          return "\u{001B}[44m"
        case .magenta:
          return "\u{001B}[45m"
        case .cyan:
          return "\u{001B}[46m"
        case .white:
          return "\u{001B}[47m"
        case .c256(let lColor):
          // color table available here: http://misc.flogisoft.com/bash/tip_colors_and_formatting
          return "\u{001B}[48;5;\(lColor)m"
        }
      }
    }
    
    /// Forground colors ANSI sequences
    public enum Cmd: CustomStringConvertible {
      case clear
      case clearLine
      case eol
      case sol
      case save
      case restore
      case home
      case cursor(Int,Int)
      case up(Int)
      case down(Int)
      case right(Int)
      case left(Int)
      
      public var description:String {
        switch self {
        case .clear:
          return "\u{001B}[2J\u{001B}[0;0f"
        case .clearLine:
          return "\u{001B}[2K"
        case .eol:
          return "\u{001B}[K"
        case .sol:
          return "\u{001B}[1K"
        case .save:
          return "\u{001B}[s"
        case .restore:
          return "\u{001B}[u"
        case .home:
          return "\u{001B}[0;0f"
        case .cursor(let pLine, let pColumn):
          return "\u{001B}[\(pLine);\(pColumn)H"
        case .up(let pLine):
          return "\u{001B}[\(pLine)A"
        case .down(let pLine):
          return "\u{001B}[\(pLine)B"
        case .right(let pColumn):
          return "\u{001B}[\(pColumn)C"
        case .left(let pColumn):
          return "\u{001B}[\(pColumn)D"
        }
      }
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

