//
//  ScriptKit+String.swift
//  ScriptKit
//
//  Created by Christophe Braud on 11/06/2017.
//  Base on Tof Templates (https://goo.gl/GdyFiw)
//  Copyright © 2017 Christophe Braud. All rights reserved.
//

import Foundation

// MARK: -
// MARK: String extension
// MARK: -
/// String extension for ANSI and tools methods
extension String {
  // MARK: -
  // MARK: Public access
  // MARK: -
  
  // MARK: -> Public enums
  
  // MARK: -> Public structs
  
  /// Expose forground ANSI colors
  public struct Fg {
    
    /// Insert a reset ANSI code before your string
    public var reset:String {
      return "\(ScriptKit.Ansi.reset)\(self.string)"
    }
    
    /// Insert ANSI text black color before your string
    public var black:String {
      return "\(ScriptKit.Ansi.Fg.black)\(self.string)"
    }
    
    /// Insert ANSI text red color before your string
    public var red:String {
      return "\(ScriptKit.Ansi.Fg.red)\(self.string)"
    }
    
    /// Insert ANSI text green color before your string
    public var green:String {
      return "\(ScriptKit.Ansi.Fg.green)\(self.string)"
    }
    
    /// Insert ANSI text yellow color before your string
    public var yellow:String {
      return "\(ScriptKit.Ansi.Fg.yellow)\(self.string)"
    }
    
    /// Insert ANSI text blue color before your string
    public var blue:String {
      return "\(ScriptKit.Ansi.Fg.blue)\(self.string)"
    }
    
    /// Insert ANSI text magenta color before your string
    public var magenta:String {
      return "\(ScriptKit.Ansi.Fg.magenta)\(self.string)"
    }
    
    /// Insert ANSI text cyan color before your string
    public var cyan:String {
      return "\(ScriptKit.Ansi.Fg.cyan)\(self.string)"
    }
    
    /// Insert ANSI text white color before your string
    public var white:String {
      return "\(ScriptKit.Ansi.Fg.white)\(self.string)"
    }
    
    /// Select color in 256 forground colors
    ///
    /// Color table available here: [Bash tips: Colors and formatting (ANSI/VT100 Control sequences)](http://misc.flogisoft.com/bash/tip_colors_and_formatting)
    ///
    /// - Parameter:
    ///   - pColor: Color index
    /// - Returns: string with color index
    public func c256(_ pColor:Int) -> String {
      return "\(ScriptKit.Ansi.Fg.c256(pColor))\(self.string)"
    }
    
    /// Original string
    private let string: String
    
    /// Contstructor with the original string
    ///
    /// - Parameter:
    ///   - pString: Original string
    public init(string pString:String) {
      self.string = pString
    }
  }
  
  /// Expose background ANSI colors
  public struct Bg {
    
    /// Insert a reset ANSI code before your string
    public var reset:String {
      return "\(ScriptKit.Ansi.reset)\(self.string)"
    }
    
    /// Insert ANSI background black color before your string
    public var black:String {
      return "\(ScriptKit.Ansi.Bg.black)\(self.string)"
    }
    
    /// Insert ANSI background red color before your string
    public var red:String {
      return "\(ScriptKit.Ansi.Bg.red)\(self.string)"
    }
    
    /// Insert ANSI background green color before your string
    public var green:String {
      return "\(ScriptKit.Ansi.Bg.green)\(self.string)"
    }
    
    /// Insert ANSI background yellow color before your string
    public var yellow:String {
      return "\(ScriptKit.Ansi.Bg.yellow)\(self.string)"
    }
    
    /// Insert ANSI background blue color before your string
    public var blue:String {
      return "\(ScriptKit.Ansi.Bg.blue)\(self.string)"
    }
    
    /// Insert ANSI background magenta color before your string
    public var magenta:String {
      return "\(ScriptKit.Ansi.Bg.magenta)\(self.string)"
    }
    
    /// Insert ANSI background cyan color before your string
    public var cyan:String {
      return "\(ScriptKit.Ansi.Bg.cyan)\(self.string)"
    }
    
    /// Insert ANSI background white color before your string
    public var white:String {
      return "\(ScriptKit.Ansi.Bg.white)\(self.string)"
    }
    
    /// Select color in 256 background colors
    ///
    /// Color table available here: [Bash tips: Colors and formatting (ANSI/VT100 Control sequences)](http://misc.flogisoft.com/bash/tip_colors_and_formatting)
    ///
    /// - Parameter:
    ///   - pColor: Color index
    /// - Returns: string with color index
    public func c256(_ pColor:Int) -> String {
      return "\(ScriptKit.Ansi.Bg.c256(pColor))\(self.string)"
    }
    
    /// Original string
    private let string: String
    
    /// Contstructor with the original string
    ///
    /// - Parameter:
    ///   - pString: Original string
    public init(string pString:String) {
      self.string = pString
    }
  }
  
  /// Expose style ANSI codes
  public struct Style {
    
    /// Insert a reset ANSI code before your string
    public var reset:String {
      return "\(ScriptKit.Ansi.reset)\(self.string)"
    }
    
    /// Insert a bright ANSI code before your string
    public var bright:String {
      return "\(ScriptKit.Ansi.bright)\(self.string)".esc("[21m")
    }
    
    /// Insert a dim ANSI code before your string
    public var dim:String {
      return "\(ScriptKit.Ansi.dim)\(self.string)".esc("[22m")
    }
    
    /// Insert a underscore ANSI code before your string
    public var underscore:String {
      return "\(ScriptKit.Ansi.underscore)\(self.string)".esc("[24m")
    }
    
    /// Insert a blink ANSI code before your string
    public var blink:String {
      return "\(ScriptKit.Ansi.blink)\(self.string)".esc("[25m")
    }
    
    /// Insert a reverse ANSI code before your string
    public var reverse:String {
      return "\(ScriptKit.Ansi.reverse)\(self.string)".esc("[27m")
    }
    
    /// Insert a hidden ANSI code before your string
    public var hidden:String {
      return "\(ScriptKit.Ansi.hidden)\(self.string)".esc("[28m")
    }
    
    /// Original string
    private let string: String
    
    /// Contstructor with the original string
    ///
    /// - Parameter:
    ///   - pString: Original string
    public init(string pString:String) {
      self.string = pString
    }
    
  }
  
  /// Expose commands ANSI codes
  public struct Cmd {
    
    /// Insert a clear ANSI code before your string
    public var clear:String {
      return "\(ScriptKit.Ansi.Cmd.clear)\(self.string)"
    }
    
    /// Insert a clear line ANSI code before your string
    public var clearLine:String {
      return "\(ScriptKit.Ansi.Cmd.clearLine)\(self.string)"
    }
    
    /// Insert a clear end of line ANSI code before your string
    public var eol:String {
      return "\(ScriptKit.Ansi.Cmd.eol)\(self.string)"
    }
    
    /// Insert a clear start of line ANSI code before your string
    public var sol:String {
      return "\(ScriptKit.Ansi.Cmd.sol)\(self.string)"
    }
    
    /// Insert a save ANSI code before your string
    public var save:String {
      return "\(ScriptKit.Ansi.Cmd.save)\(self.string)"
    }
    
    /// Insert a restore ANSI code before your string
    public var restore:String {
      return "\(ScriptKit.Ansi.Cmd.restore)\(self.string)"
    }
    
    /// Insert a home ANSI code before your string
    public var home:String {
      return "\(ScriptKit.Ansi.Cmd.home)\(self.string)"
    }
    
    /// Insert cursor position code before your string
    ///
    /// - Parameters:
    ///   - pLine: line where you want to position the cursor
    ///   - pColumn: Column where you want to position the cursor
    /// - Returns: ANSI code with cursor position and original string
    public func cursor(line pLine:Int, column pColumn:Int) -> String {
      return "\(ScriptKit.Ansi.Cmd.cursor(pLine,pColumn))\(self.string)"
    }
    
    /// Insert up lines instruction before your string
    ///
    /// - Parameter:
    ///   - pLine: Number of lines
    /// - Returns: ANSI instructions with up lines and original string
    public func up(line pLine:Int) -> String {
      return "\(ScriptKit.Ansi.Cmd.up(pLine))\(self.string)"
    }
    
    /// Insert down lines instruction before your string
    ///
    /// - Parameter:
    ///   - pLine: Number of lines
    /// - Returns: ANSI instructions with down lines and original string
    public func down(line pLine:Int) -> String {
      return "\(ScriptKit.Ansi.Cmd.down(pLine))\(self.string)"
    }
    
    /// Insert right columns instruction before your string
    ///
    /// - Parameter:
    ///   - pColumn: Number of columns
    /// - Returns: ANSI instructions with right columns and original string
    public func right(column pColumn:Int) -> String {
      return "\(ScriptKit.Ansi.Cmd.right(pColumn))\(self.string)"
    }
    
    /// Insert left columns instruction before your string
    ///
    /// - Parameter:
    ///   - pColumn: Number of columns
    /// - Returns: ANSI instructions with left columns and original string
    public func left(column pColumn:Int) -> String {
      return "\(ScriptKit.Ansi.Cmd.left(pColumn))\(self.string)"
    }
    
    /// Original string
    private let string: String
    
    /// Contstructor with the original string
    ///
    /// - Parameter:
    ///   - pString: Original string
    public init(string pString:String) {
      self.string = pString
    }
    
  }
  
  // MARK: -> Public class
  
  // MARK: -> Public type alias
  
  // MARK: -> Public static properties
  
  // MARK: -> Public properties
  
  // XT: Alias properties
  
  /// Alias to style property
  public var s:Style {
    return self.style
  }
  
  /// Access to ANSI style
  public var style:Style {
    return Style(string: self)
  }
  
  /// Alias to forground property
  public var fg:Fg {
    return self.forground
  }
  
  /// Access to ANSI forground colors
  public var forground:Fg {
    return Fg(string: self)
  }
  
  /// Alias to background property
  public var bg:Bg {
    return self.background
  }
  
  /// Access to ANSI background colors
  public var background:Bg {
    return Bg(string: self)
  }
  
  /// Alias to cmd property
  public var c:Cmd {
    return Cmd(string: self)
  }
  
  /// Access to ANSI commands
  public var cmd:Cmd {
    return Cmd(string: self)
  }
  
  /// Length of the string
  public var length:Int {
    let lRet = self.count
    
    return lRet
  }
  
  // MARK: -> Public class methods
  
  // XT: ANSI methods
  
  /// Insert ANSI code after the string
  ///
  /// - Parameter:
  ///   - pCode: ANSI code
  /// - Returns: string with the ANSI code
  public func esc(_ pCode:String) -> String {
    return "\(self)\(ScriptKit.Ansi.esc)\(pCode)"
  }
  
  // XT: Format methods
  
  /// Format bytes
  ///
  /// - Parameters:
  ///   - pBytes: Bytes value
  ///   - pDecimal: Decimal you want to display
  /// - Returns: generate a string with the bytes in B (bytes), KB, MB, GB, TB, PB, EB, ZB, YB
  public static func format(bytes pBytes:Float, decimal pDecimal:Int = 0) -> String {
    var lRet = "0B"
    
    if pBytes > 0.0 {
      let lExp = Int(log(pBytes) / log(1024))
      
      if lExp == 0 {
        lRet = String(format: "%0fB", pBytes)
      } else {
        let lBytes = "bKMGTPEZY"[lExp]
        let lSize = Double(pBytes) / Double(pow(Double(1024),Double(lExp)))
        let lFormat = String(format: "%%.%ldf%%@B", pDecimal)
        lRet = String(format: lFormat, lSize, lBytes)
      }
    }
    
    return lRet
  }
  
  /// Format speed
  ///
  /// - Parameters:
  ///   - pSpeed: Speed in bytes per second
  ///   - pDecimal: Decimal you want to display
  /// - Returns: generate a string with the bytes in B/s (bytes), KB/s, MB/s, GB/s, TB/s, PB/s, EB/s, ZB/s, YB/s
  public static func format(speed pSpeed:Float, decimal pDecimal:Int = 0) -> String {
    let lRet = String.init(format: "%@/s", String.format(bytes: pSpeed, decimal: pDecimal))
    return lRet
  }
  
  /// Format time interval
  ///
  /// - Parameter
  ///   - pTimeInterval: Time interval value
  /// - Returns: strime with the time interval formated
  public static func format(timeInterval pTimeInterval: TimeInterval) -> String {
    let lTimeInterval = Int(pTimeInterval)
    var lRet = "0s"
    
    if lTimeInterval > 0 {
      var lDays = 0
      var lHours = 0
      var lMins = lTimeInterval/60
      let lSeconds = lTimeInterval - (lMins * 60)
      
      if lMins > 60 {
        lHours = lMins / 60;
        lMins %= 60;
        
        if lHours > 24 {
          lDays = lHours / 24;
          lHours %= 24;
        }
      }
      
      if lDays > 0 {
        lRet = String(format: "%02dj %02dh%02dm%02ds", lDays, lHours, lMins, lSeconds)
      } else if lHours > 0 {
        lRet = String(format: "%02dh%02dm%02ds", lHours, lMins, lSeconds)
      } else if lMins > 0 {
        lRet = String(format: "%02dm%02ds", lMins, lSeconds)
      } else {
        lRet = String(format: "%ds", lSeconds)
      }
    }
    
    return lRet
  }
  
  // MARK: -> Public init methods
  
  // MARK: -> Public operators
  
  // MARK: -> Public methods
  
  // MARK: --> subscript
  
  // XT: Subscripts
  
  /// Char of a string
  ///
  /// - Parameter:
  ///   - pIndex: Index in the string
  public subscript(pIndex: Int) -> String {
    var lRet = ""
    
    if pIndex < self.length && pIndex > -1 {
      let lIndex = characters.index(startIndex, offsetBy: pIndex)
      lRet = "\(self[lIndex])"
    }
    
    return lRet
  }
  
  /// Extract a countable range of a string
  ///
  /// - Parameter:
  ///   - pRange: A countable range
  public subscript(pRange: CountableRange<Int>) -> String {
    var lRet = ""
    
    if pRange.lowerBound >= 0 && pRange.upperBound <= self.length {
      let lStart = self.characters.index(startIndex, offsetBy: pRange.lowerBound)
      let lEnd = self.characters.index(startIndex, offsetBy: pRange.upperBound)
      let lRange = lStart..<lEnd
      lRet = String(self[lRange])
    }
    return lRet
  }
  
  /// Extract a countable closed range of a string
  ///
  /// - Parameter:
  ///   - pRange: A countable closed range
  public subscript(pRange: CountableClosedRange<Int>) -> String {
    var lRet = ""
    
    if pRange.lowerBound >= 0 && pRange.upperBound <= self.length {
      let lStart = self.characters.index(startIndex, offsetBy: pRange.lowerBound)
      let lEnd = self.characters.index(startIndex, offsetBy: pRange.upperBound)
      let lRange = lStart...lEnd
      lRet = String(self[lRange])
    }
    return lRet
  }
  
  // MARK: --> Extract
  
  // XT: Extract methods
  
  /// Replace a substring by another substring
  ///
  /// - Parameters:
  ///   - pString: Search substring
  ///   - pSub: Replace substring
  ///   - pNb: Number of occurence you want to replace. By default all.
  /// - Returns: a new instance of which was the replacement, otherwise return the original string
  public func replace(string pString:String, sub pSub:String, nb pNb:Int = -1) -> String {
    var lRet:String = self
    var lNb = 0
    
    while let lRange = lRet.range(of: pString) , pNb == -1 || lNb < pNb {
      lNb += 1
      lRet.replaceSubrange(lRange, with: pSub)
    }
    
    return lRet
  }
  
  /// Extract string before a specific string
  ///
  /// - Parameter:
  ///   - pString: String to search
  /// - Returns: a new instance with the string before the string in parameter, otherwise return `nil`
  public func before(_ pString:String) -> String? {
    var lRet:String? = nil
    
    if let lRange = self.range(of: pString) {
      lRet = String(self[..<lRange.lowerBound])
    }
    
    return lRet
  }
  
  /// Extract string after a specific string
  ///
  /// - Parameter:
  ///   - pString: String to search
  /// - Returns: a new instance with the string after the string in parameter, otherwise return `nil`
  public func after(_ pString:String) -> String? {
    var lRet:String? = nil
    
    if let lRange = self.range(of: pString) {
      lRet = String(self[lRange.upperBound...])
    }
    
    return lRet
  }
  
  /// Extract the last occurence
  ///
  /// - Parameter:
  ///   - pSeparator: Split the string with this separator
  /// - Returns: last occurence of string, otherwise return `nil`
  public func lastWord(_ pSeparator:String = " ") -> String? {
    var lRet:String? = nil
    let lCharset = CharacterSet(charactersIn:pSeparator)
    
    if self.rangeOfCharacter(from: lCharset) != nil {
      if let lLast = self.components(separatedBy: lCharset).last {
        lRet = lLast
      }
    }
    
    return lRet
  }
  
  /// Extract the string without the last occurence
  ///
  /// - Parameter:
  ///   - pSeparator: Split the string with this separator
  /// - Returns: string without the last occurence, otherwise return `nil`
  public func withoutLastWord(_ pSeparator:String = " ") -> String? {
    var lRet:String? = nil
    
    if let lLastWord = self.lastWord(pSeparator) {
      if let lBefore = self.before(lLastWord)?.trimEnd(pSeparator) {
        lRet = lBefore
      }
    }
    
    return lRet
  }
  
  // MARK: --> Trim
  
  // XT: Trim methods
  
  /// Trim the beginning of the string
  ///
  /// - Parameter:
  ///   - pCharacters: Set of characters you want to remove. By default set to " \n\r\t"
  /// - Returns: a new string without the characters specify in the parameter, otherwise return the original string
  public func trimStart(_ pCharacters:String = " \n\r\t") -> String {
    let lEnd = self.count - 1
    var lStart = 0
    var lRet = self
    
    if lEnd > lStart {
      while pCharacters.contains(self[lStart]) {
        lStart += 1
      }
      
      lRet = self[lStart...lEnd]
    }
    return lRet
  }
  
  /// Trim the end of the string
  ///
  /// - Parameter:
  ///   - pCharacters: Set of characters you want to remove. By default set to " \n\r\t"
  /// - Returns: a new string without the characters specify in the parameter, otherwise return the original string
  public func trimEnd(_ pCharacters:String = " \n\r\t") -> String {
    var lEnd = self.count - 1
    var lRet = self
    
    while pCharacters.contains(self[lEnd]) {
      lEnd -= 1
    }
    
    if lEnd > -1 {
      lRet = self[0...lEnd]
    }
    
    return lRet
  }
  
  /// Trim both begining and end of the string
  ///
  /// - Parameter:
  ///   - pCharacters: Set of characters you want to remove. By default set to " \n\r\t"
  /// - Returns: a new string without the characters specify in the parameter, otherwise return the original string
  public func trim(_ pCharacters:String = " \n\r\t") -> String {
    let lRet = self.trimStart(pCharacters).trimEnd(pCharacters)
    return lRet
  }
  
  // XT: Split methods
  
  /// Split a string into substrings of equal length
  ///
  /// - Parameter:
  ///   - pSize: Size of each substrings
  /// - Returns: an array of strings
  public func split(size pSize: Int) -> [String] {
    let lRet:[String] = stride(from: 0, to: self.count, by: pSize).map {
      let lStart = self.index(self.startIndex, offsetBy: $0)
      let lEnd = self.index(lStart, offsetBy: pSize, limitedBy: self.endIndex) ?? self.endIndex
      return String(self[lStart..<lEnd])
    }
    return lRet
  }
  
  // XT: Replace methods
  
  /// Search all occurence of a string and replace them by another string
  ///
  /// - Parameters:
  ///   - pSearch: String to search
  ///   - pWith: Replace string
  ///   - pNb: Number of occurences. By default -1 for all occurences
  /// - Returns: a new string with the modification
  public func replace(search pSearch:String, with pWith:String, nb pNb:Int = -1) -> String {
    var lRet = self
    var lNb = 0
    
    while let lRange = lRet.range(of: pSearch) , pNb == -1 || lNb < pNb {
      lNb += 1
      lRet.replaceSubrange(lRange, with: pWith)
    }
    
    return lRet
  }
  
  // XT: RegEx methods
  
  /// Search all occurence of a regex and replace by a template for each
  ///
  /// - Parameters:
  ///   - pRegEx: Regular expression use to search
  ///   - pTemplate: Template use to replace
  /// - Returns: a new string with the modification
  public func replace(regEx pRegEx: String, template pTemplate: String, partial pPartial:Bool = false) -> String? {
    var lRet:String? = nil
    
    do {
      if self.match(regEx: pRegEx, partial: pPartial) {
        let lRegex = try NSRegularExpression(pattern: pRegEx, options: [])
        lRet = lRegex.stringByReplacingMatches(in: self, options: [], range: NSRange(location: 0, length: self.count), withTemplate: pTemplate)
      }
    } catch let lError {
      debugPrint("\"\(self)\".replace(regEx:\(pRegEx), template:\(pTemplate)) => \(lError)")
    }
    
    return lRet
  }
  
  /// Extract all occurences of a regex
  ///
  /// - Parameter:
  ///   - pRegEx: Regular Expression to extract
  /// - Returns: an array with all occurence of the regex
  public func extract(regEx pRegEx: String) -> [String] {
    var lRet:[String] = []
    
    do {
      let lRegex = try NSRegularExpression(pattern: pRegEx, options: [])
      let lNSString = self as NSString
      let lMatchs = lRegex.matches(in: self, options: [], range: NSRange(location: 0, length: lNSString.length))
      
      for lMatch in lMatchs {
        // Range 0 all string match. 1 to N each element
        if lMatch.numberOfRanges > 1 {
          for lI in 1..<lMatch.numberOfRanges {
            let lItem = lNSString.substring(with: lMatch.range(at: lI))
            lRet.append(lItem)
          }
        }
      }
    } catch let lError {
      debugPrint("\"\(self)\".extract(regEx:\(pRegEx)) => \(lError)")
    }
    
    return lRet
  }
  
  /// Check if the string match a regex
  ///
  /// - Parameter:
  ///   - pRegEx: Regular Expression
  ///   - pPartial: `false` must match all the string, `true` partial match is accepted
  /// - Returns: `true` if the regex match with the string. Otherwise return `false`
  public func match(regEx pRegEx: String, partial pPartial:Bool = false) -> Bool {
    var lRet:Bool = false
    
    do {
      let lRegex = try NSRegularExpression(pattern: pRegEx, options: [.caseInsensitive])
      
      if let lMatch = lRegex.firstMatch(in: self, options: [], range: NSMakeRange(0, self.utf16.count)) {
        lRet = pPartial == false ? lMatch.range.location == 0 && lMatch.range.length == self.utf16.count : true
      }
    } catch let lError {
      debugPrint("string: \"\(self)\"\nregEx:\"\(pRegEx)\"\nError: \(lError)")
    }
    
    return lRet
  }
  
  
  // MARK: -> Public class override Mappable
  
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

