//
//  ScriptKit+Command.swift
//  ScriptKit
//
//  Created by Christophe Braud on 11/06/2017.
//  Base on Tof Templates (https://bit.ly/2OWAgmb)
//  Copyright © 2017 Christophe Braud. All rights reserved.
//

import Foundation

// MARK: -
// MARK: Console extension
// MARK: -
/// ScriptKit extension for console methods
public extension ScriptKit {
  // MARK: -
  // MARK: Public access
  // MARK: -
  
  // MARK: -> Public enums
  
  public enum Output {
    case stdout
    case stderr
  }
  
  // MARK: -> Public structs
  
  // MARK: -> Public class
  
  // MARK: -> Public type alias 
  
  public typealias ConsoleHandler = (String) -> Void

  // MARK: -> Public static properties
  
  // MARK: -> Public properties
  
  // MARK: -> Public class methods

  /// Clear the screen
  ///
  /// - Returns: ScriptKit class object for chaining
  @discardableResult
  public class func clear() -> ScriptKit.Type {
    print(output: .stdout, format: "".cmd.clear)
    return self
  }
  
  /// Clear from the cursor to the end of line
  ///
  /// - Returns: ScriptKit class object for chaining
  @discardableResult
  public class func clearEOL() -> ScriptKit.Type {
    print(output: .stdout, format: "".cmd.eol)
    return self
  }
  
  /// Clear from the cursor to the start of line
  ///
  /// - Returns: ScriptKit class object for chaining
  @discardableResult
  public class func clearSOL() -> ScriptKit.Type  {
    print(output: .stdout, format: "".cmd.sol)
    return self
  }
  
  /// Clear the current line
  ///
  /// - Returns: ScriptKit class object for chaining
  @discardableResult
  public class func clearLine() -> ScriptKit.Type  {
    print(output: .stdout, format: "".cmd.clearLine)
    return self
  }
  
  /// Save cursor position
  ///
  /// - Returns: ScriptKit class object for chaining
  @discardableResult
  public class func save() -> ScriptKit.Type  {
    print(output: .stdout, format: "".cmd.save)
    return self
  }
  
  /// Restore cursor position
  ///
  /// - Returns: ScriptKit class object for chaining
  @discardableResult
  public class func restore() -> ScriptKit.Type  {
    print(output: .stdout, format: "".cmd.restore)
    return self
  }
  
  /// Position the cursor on the row 0 column 0
  ///
  /// - Returns: ScriptKit class object for chaining
  @discardableResult
  public class func home() -> ScriptKit.Type  {
    print(output: .stdout, format: "".cmd.home)
    return self
  }
  
  /// Change the positon of the cursor
  ///
  /// - Parameters:
  ///   - pLine: Line
  ///   - pColumn: Column
  /// - Returns: ScriptKit class object for chaining
  @discardableResult
  public class func cursor(_ pLine:Int, _ pColumn:Int) -> ScriptKit.Type  {
    print(output: .stdout, format: "".cmd.cursor(line: pLine, column: pColumn))
    return self
  }
  
  /// Returns the size of the terminal window
  ///
  /// - Returns: ScriptKit class object for chaining
  public class func screenSize() -> (width: Int, height: Int) {
    var lWinSize = winsize()
    _ = ioctl(STDOUT_FILENO, UInt(TIOCGWINSZ), &lWinSize);
    return (Int(lWinSize.ws_col), Int(lWinSize.ws_row))
  }
  
  /// Format a title with a description
  ///
  /// - Parameters:
  ///   - pTitle: Title
  ///   - pDescription: Description
  /// - Returns: ScriptKit class object for chaining
  @discardableResult
  public class func print(title pTitle:String, description pDescription:String) -> ScriptKit.Type  {
    let lWidth = screenSize().width
    let lRawTitle = pTitle.replace(regEx: "\u{1b}\\[[^m]*m", template: "", partial: true) ?? pTitle
    let lTitleSize = lRawTitle.count
    let lLines = pDescription.split(size: lWidth - lTitleSize)

    for lI in 0..<lLines.count {
      var lDisplay = ""
      
      if lI == 0 {
        lDisplay = "\(pTitle)\(lLines[lI])"
      } else {
        lDisplay = String(repeating: " ", count: lTitleSize) + lLines[lI]
      }
      
      print(lDisplay + "\n")
    }
    
    return self
  }
  
  /// Displays a string at the current position on stdout
  ///
  /// - Parameter:
  ///   - pString: String to display
  /// - Returns: ScriptKit class object for chaining
  @discardableResult
  public class func print(_ pString:String) -> ScriptKit.Type  {
    print(format: pString)
    return self
  }
  
  /// Displays a string at the current position on stdout or stderr
  ///
  /// - Parameters:
  ///   - pOutput: Specifies where the string is displayed. Can take values `stdout` or `stderr`
  ///   - pString: String to display
  /// - Returns: ScriptKit class object for chaining
  @discardableResult
  public class func print(output pOutput:Output, _ pString:String) -> ScriptKit.Type  {
    print(output: pOutput, format: pString)
    return self
  }
  
  /// Format a string by taking the values after `format` and display it on `stdout` or `stderr`
  ///
  /// - Parameters:
  ///   - pOutput: Specifies where the string is displayed. Can take values `stdout` or `stderr`
  ///   - pFormat: String format
  ///   - pArgs: Values associate with the string format
  /// - Returns: ScriptKit class object for chaining
  @discardableResult
  public class func print(output pOutput:Output = .stdout, format pFormat:String, _ pArgs:CVarArg...) -> ScriptKit.Type  {
    let lMessage = pArgs.count > 0 ? String(format: pFormat, pArgs) : pFormat

    if let lData = lMessage.data(using: .utf8) {
      if pOutput == .stdout {
        FileHandle.standardOutput.write(lData)
      } else {
        FileHandle.standardError.write(lData)
      }
    }
    return self
  }
  
  /// Allows the user to enter text
  ///
  /// - Parameters:
  ///   - pText: Display a text before the input
  ///   - pHandler: Call the handler when the user click on ⏎
  /// - Returns: ScriptKit class object for chaining
  @discardableResult
  public class func input(_ pText:String="", handler pHandler:ConsoleHandler? = nil) -> ScriptKit.Type {
    
    if pText.isEmpty == false {
      print(format:pText)
    }
    
    let lKeyboard = FileHandle.standardInput
    let lInputData = lKeyboard.availableData
    let lStrData = String(data: lInputData, encoding: String.Encoding.utf8)!
    let lInput = lStrData.trimmingCharacters(in: CharacterSet.newlines)
    
    if let lHandler = pHandler {
      lHandler(lInput)
    }
    
    return self
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
