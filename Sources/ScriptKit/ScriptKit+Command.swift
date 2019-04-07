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
// MARK: Command extension
// MARK: -
/// ScriptKit extension for commands
extension ScriptKit {
  
  // MARK: -
  // MARK: Public access
  // MARK: -
  
  // MARK: -> Public enums
  
  // MARK: -> Public structs
  
  /// Manage display
  public struct Display {
    
    public enum `Type` {
      case none
      case trace
      case info
      case warning
      case error
      case yes
      case no
      case compute
      case build
      case action
      case msg
      case done
    }
    
    /// Last action done
    public static var lastAction:Type = .none
    
    /// Enable verbose mode
    public static var verbose:Bool = false
    
    /// Enable hiden mode
    public static var hidden:Bool = false
    
    /// Level of actions
    public static var level:Int = 0
    
    public static func push(hidden pHidden: Bool, body pBody:() -> Void, defer pDefer:() -> Void = {}) {
      let lPrevious = hidden
      hidden = pHidden
      pBody()
      pDefer()
      hidden = lPrevious
    }
  }
  
  // MARK: -> Public class
  
  public class Version {
    public var progam:String = ""
    public var remote:String = ""
    public var source:String = ""
  }
  
  // MARK: -> Public type alias
  
  public typealias CmdHandler = ([String:String]) -> Void
  
  // MARK: -> Public static properties
  
  // XT: Properties
  
  /// Current version of the tool
  public static var version = Version()
  
  /// Copyright of the tool
  public static var owner:String = ""
  
  /// Year of the tool
  public static var year:String = ""
  
  /// Description of the tool
  public static var info:String = ""
  
  /// Last error
  public static var error:Error? = nil
  
  /// The variable names (keys) and their values in the environment from which the process was launched.
  public static var environment:[String:String] {
    return ProcessInfo.processInfo.environment
  }
  
  // MARK: -> Public properties
  
  // MARK: -> Public class methods
  
  
  // XT: Declare command line interface
  
  /// Declare version, copyright, year and a description of what your command line app is doing
  /// ATTENTION: This method will reset all internal datas. You will loose all previous settings
  ///
  /// - Parameters:
  ///   - pVersion: Version of your app
  ///   - pOwner: Owner of your app
  ///   - pYear: Year of your app
  ///   - pInfo: Description of what your application is doing
  /// - Returns: ScriptKit class object for chaining settings
  public class func program(version pVersion:String, owner pOwner:String, year pYear:String="", info pInfo:String="")  {
    self.error = ScriptError.noerror
    self.stack = []
    self.current = nil
    self.cmds = []
    self.version.progam = pVersion
    self.owner = pOwner
    self.year = pYear
    self.info = pInfo
  }
  
  /// Your application can define a collection of commands and sub-commands
  ///
  /// Each command have his own keyword, a text that describ the commande and instructions
  ///
  /// - Parameters:
  ///   - pName: Key word for this command
  ///   - pVariable: Store the next value after the command on this variable
  ///   - pTitle: A short descrition of this command
  ///   - pHelp: A long descrition of this command
  ///   - pCmdHandler: Instrutions of this command
  /// - Returns: ScriptKit class object for chaining settings
  public class func cmd(_ pName:String, variable pVariable:String?=nil, title pTitle:String="", help pHelp:String="", handler pCmdHandler:CmdHandler? = nil) {
    if self.scriptError == .noerror {
      let lCmd = Cmd(name: pName, variable: pVariable, title:pTitle, help: pHelp, handler: pCmdHandler)
      
      if let lCurrent = self.current {
        if lCurrent.cmds != nil {
          // Sub-command of the current command
          self.stack.append(lCurrent)
          lCurrent.cmds?.append(lCmd)
          self.current = lCmd
        } else {
          if let lCurrent = self.stack.last {
            // Sub-command of the parent
            lCurrent.cmds?.append(lCmd)
            self.current = lCmd
          } else {
            self.cmds.append(lCmd)
          }
        }
      } else {
        // New main command
        self.cmds.append(lCmd)
      }
    }
  }
  
  /// You can define a command with it's keyword and description, and later provide the instructions.
  /// This methode will association the instructions to the current command.
  ///
  /// - Parameter:
  ///   - pCmdHandler: Instructions to associate to the current command
  /// - Returns: ScriptKit class object for chaining settings
  public class func cmd(handler pCmdHandler:@escaping CmdHandler) {
    if self.scriptError == .noerror {
      if let lCurrent = self.current {
        lCurrent.handler = pCmdHandler
      } else {
        if let lLast = self.cmds.last {
          lLast.handler = pCmdHandler
        } else {
          self.scriptError = .cmd("'cmd()' instruction missing")
        }
      }
    }
  }
  
  /// You can change the handler if you the path of a command
  ///
  /// - Parameters:
  ///   - pPath: Path to the command.
  ///   - pCmdHandler: Instructions associated with the command
  public class func cmd(path pPath:String, handler pCmdHandler:@escaping CmdHandler) {
    let lItems = pPath.components(separatedBy: ".")
    var lCmd:Cmd? = Cmd(cmds: self.cmds)
    
    if lItems.count > 0 {
      for lItem in lItems {
        if let lIndex = lCmd?.cmds?.firstIndex(where: { $0.name == lItem }) {
          lCmd = lCmd?.cmds?[lIndex]
        } else {
          lCmd = nil
          break
        }
      }
    }
    
    if let lFound = lCmd {
      lFound.handler = pCmdHandler
    } else {
      self.scriptError = .cmd("Invalid path")
    }
  }
  
  /// You can change the title or/and the help if you the path of a command
  ///
  /// - Parameters:
  ///   - pPath: Path to the command.
  ///   - pCmdHandler: Instructions associated with the command
  public class func cmd(path pPath:String, title pTile:String? = nil, help pHelp:String? = nil) {
    let lItems = pPath.components(separatedBy: ".")
    var lCmd:Cmd? = Cmd(cmds: self.cmds)
    
    if lItems.count > 0 {
      for lItem in lItems {
        if let lIndex = lCmd?.cmds?.firstIndex(where: { $0.name == lItem }) {
          lCmd = lCmd?.cmds?[lIndex]
        } else {
          lCmd = nil
          break
        }
      }
    }
    
    if let lFound = lCmd {
      if let lTitle = pTile {
        lFound.title = lTitle
      }
      if let lHelp = pHelp {
        lFound.help = lHelp
      }
    } else {
      self.scriptError = .cmd("Invalid path")
    }
  }
  
  /// Each command can define a set of options. Each option must define a long keyword and a variable. A short keyword, a default value for the variable,
  /// are optionals.
  ///
  /// - Parameters:
  ///   - pShort: Define a short keyword for the option. By default is empty.
  ///   - pLong: Define a long keyword for the option
  ///   - pVariable: Associate a variable to the option
  ///   - pEnv: Environment variable corresponding to the parameter. If the parameter is not supplied, look for the value in the environment variable.
  ///   - pDefault: Defined a default value for the variable. By default is `nil` for not used.
  ///   - pOptional: `true` the option is optional, `false` is required. By default is optional.
  ///   - pTitle: A short descrition of this command
  ///   - pHelp: A long descrition of this command
  /// - Returns: ScriptKit class object for chaining settings
  public class func option(short pShort:String="", long pLong:String, variable pVariable:String="", env pEnv:String="", `default` pDefault:String?=nil, value pValue:String?=nil, optional pOptional:Bool=true, title pTitle:String="", help pHelp:String="") {
    if self.scriptError == .noerror {
      
      guard pLong.isEmpty == false else {
        self.scriptError = .cmd("'long' name is empty")
        return
      }
      
      let lVariable = pVariable.isEmpty ? pLong : pVariable
      let lOption = Option(short: pShort, long: pLong, variable: lVariable, env: pEnv, default: pDefault, value: pValue, optional: pOptional, title:pTitle, help: pHelp)
      
      if let lCurrent = self.current {
        // Option for the current command
        lCurrent.options.append(lOption)
      } else {
        if let lLast = self.cmds.last {
          // Option for the last main command
          lLast.options.append(lOption)
        } else {
          self.scriptError = .cmd("For option \"\(pLong)\" no command define")
        }
      }
    }
  }
  
  /// Use to introduce a new sub-command of the current command
  ///
  /// - Returns: ScriptKit class object for chaining settings
  public class func begin() {
    if self.scriptError == .noerror {
      if let lCurrent = self.current {
          if lCurrent.cmds == nil {
            lCurrent.cmds = []
        }
      } else {
        if let lLast = self.cmds.last {
          if lLast.cmds == nil {
            lLast.cmds = []
          }
          self.current = lLast
        } else {
          self.scriptError = .cmd("No sub-command defined")
        }
      }
    }
  }
  
  /// Use to get back to the parent command
  ///
  /// - Returns: ScriptKit class object for chaining settings
  public class func end() {
    if self.scriptError == .noerror {
      if self.stack.count > 0 {
        let lCurrent = self.current
        
        if self.stack.count == 0 {
          self.current = nil
        } else {
          self.current = self.stack.removeLast()

          if self.current?.cmds?.last?.name == lCurrent?.name {
            if self.stack.count == 0 {
              self.current = nil
            } else {
              self.current = self.stack.removeLast()
            }
          }
        }
      } else {
        if self.current != nil {
          self.current = nil
        } else {
          self.scriptError = .cmd("'begin' instruction missing")
        }
      }
    }
  }
  
  /// It's the main method of your command line. It's where everthing begin.
  ///
  /// This method check, validate and execute your command.
  /// Call it like this:
  /// ```
  ///  // main.swift
  ///  import Foundation
  ///  import ScriptKit
  ///
  ///  public class MyCommandLineTool : ScriptKit {
  ///    public class func main() {
  ///      run(arguments: CommandLine.arguments)
  ///   }
  /// }
  /// ```
  /// - Parameter:
  ///   - pArguments: Array of paramèters
  public class func run(arguments pArguments:[String]) {
    var lCmd = Cmd()
    
    lCmd.cmds = self.cmds
    
    if pArguments.count == 1 {
      let lProgram = ((pArguments.first.unwrappedOr(default: "")) as NSString).lastPathComponent
      print("\nUsage".cli.title + ": \(lProgram) ".cli.text + "COMMAND <value>".cli.cmd + " [".cli.text + "subcommand <value>".cli.cmd + "] [".cli.text + "--longOption".cli.option.key.required + "] [".cli.text + "--longOption=value".cli.option.key.required + "] [".cli.text + "-shortOption".cli.option.key.required + "] [".cli.text + "-shortOption value".cli.option.key.required + "]\n\n".cli.text)
      print(self.info)
      self.help(cmd: lCmd, subcommands: false)
      
      print("Copyright © ".cli.copyright + self.year.cli.year + " " + self.owner.cli.owner)
      
      if self.version.progam.isEmpty == false {
        print(", version ".cli.version + self.version.progam.cli.nversion)
      }

      if self.version.source != self.version.remote {
        print("\nUpdate default source version from ".cli.text + self.version.source.cli.nversion + " to version ".cli.text + self.version.remote.cli.nversion)
      }
      
      print("\n\n".cli.text)
    } else {
      var lVars:[String:String] = [:]
      var lArgs:[String] = pArguments
      var lInvalids:[String] = []
      
      lArgs.removeFirst()
      
      while lArgs.count > 0 {
        let lArg = lArgs.removeFirst()
        // Options
        if let lVal = self.eval(options: lCmd.options, parameter: lArg, stack: &lArgs) {
          if lVal.option.value != nil && lVal.value == nil {
            lInvalids.append(lArg)
            continue
          }
          
          lVars[lVal.option.variable] = lVal.value.unwrappedOr(default: "")
        } else {
          // Sub-commands
          if let lSubcmds = lCmd.cmds {
            if let lIndex = lSubcmds.firstIndex(where: { $0.name == lArg }) {
              lCmd = lSubcmds[lIndex]
              if let lVariable = lCmd.variable {
                if lArgs.count > 0 {
                  let lValue = lArgs.removeFirst()
                  
                  if lValue.hasPrefix("-") || lValue.hasPrefix("--") {
                    lArgs.append(lValue)
                    continue
                  }
                  lVars[lVariable] = lValue
                }
              }
            } else {
              lInvalids.append(lArg)
            }
          } else {
            lInvalids.append(lArg)
          }
        }
      }
      
      for lOption in lCmd.options {
        if lVars.keys.contains(lOption.variable) == false && lOption.env.isEmpty == false {
          if let lValue = env[lOption.env] {
            lVars[lOption.variable] = lValue
          }
        }
      }
      
      var lDisplayHelp = false
      
      // Found option '--help'
      if lVars.keys.contains(where: { $0 == "help" }) {
        lDisplayHelp = true
      } else {
        // Command with option required
        if (lCmd.options.filter({$0.optional==false}).count > 0) {
          if lVars.keys.count == 0 {
            lDisplayHelp = true
          }
        } else {
          // Command with parameter
          if lCmd.variable != nil && lVars.keys.count == 0 {
            lDisplayHelp = true
          } else {
            // Command with a list of sub-commands
            if lCmd.variable == nil && ((lCmd.cmds?.count).unwrappedOr(default: 0)) > 0 {
              lDisplayHelp = true
            }
          }
        }
      }
      
      if lDisplayHelp == true {
        self.help(cmd: lCmd)
      } else {
        if lInvalids.count > 0 {
          let lPlurial = lInvalids.count > 1 ? "s" : ""
          print("\nOption\(lPlurial) invalid\(lPlurial)".cli.title + ":\n".cli.text)
          for lInvalid in lInvalids {
            print(" - ".cli.text + "\(lInvalid)\n".cli.option.key.required)
          }
          
          print("\n")
        }
        
        let lRequire = Set(lCmd.options.filter({ $0.optional == false }).map({ $0.long }))
        let lMissings = lRequire.subtracting(Set(lVars.keys))
        
        if lMissings.count > 0 {
          let lPlurial = lMissings.count > 1 ? "s" : ""
          var lSize = 0
          
          lMissings.forEach({
            pLong in
            
            if lSize < pLong.count {
              lSize = pLong.count
            }
          })
          
          lSize += 2
          
          print("\nOption\(lPlurial) required".cli.title + ":\n".cli.text)
          
          for lLong in lMissings {
            if let lOption = lCmd.options.filter({ $0.long == lLong }).first {
              var lDisplay = " -".cli.text
              
              lDisplay += lOption.long.cli.option.key.required
              lDisplay += String(repeating: " ", count: lSize - lOption.long.count)
              lDisplay += lOption.help.cli.option.text.required
              
              print(lDisplay + "\n")
            }
          }
          
          print("\n")
        } else {
          if let lHandler = lCmd.handler {
            lHandler(lVars)
          }
        }
      }
    }
  }
  
  // XT: Display methods
  
  /// Display different types of messages
  ///
  /// - Parameters:
  ///   - pType: Type of message. Can be `info`, `warning`, `error`, `yes`, `no`, `compute`, `build`, `action`, `msg` or `done`.
  ///   - pVerbose: `true` display the message
  ///   - pClear: `true` erase the current line, `false` display the message to the next line. By default `compute` message are erase by a next message
  ///   - pFormat: Format of the message
  ///   - pArgs: Parameters associate to the format
  public class func display(type pType:Display.`Type`, verbose pVerbose:Bool = false, clear pClear:Bool = false, format pFormat:String = "",_ pArgs:CVarArg...) {
    if Display.hidden {
      return
    }
    
    let lSpace = String(repeating:" ", count: Display.level * 2)
    var lMessage = pArgs.count > 0 ? String(format: pFormat, arguments: pArgs) : pFormat
    var lBol = "\n"
    
    if pClear || Display.lastAction == .compute {
      lBol = "\r" + Ansi.Cmd.eol.description
    }
    
    if pVerbose == false || (pVerbose == true && Display.verbose == true) {
      Display.lastAction = pType
      
      switch pType {
      case .none:
        break
      case .trace:
        print(lBol + "\(lSpace)    " + lMessage.cli.text)
      case .info:
        print(lBol + "\(lSpace) 🔹  " + lMessage.cli.info)
      case .warning:
        print(lBol + "\(lSpace) ⚠️  " + lMessage.cli.warning)
      case .error:
        print(lBol + "\(lSpace) ⛔️  " + lMessage.cli.error)
        scriptError = .cmd(lMessage)
      case .yes:
        print(lBol + "\(lSpace) ✔︎ ".s.bright.fg.green + lMessage.cli.text)
      case .no:
        print(lBol + "\(lSpace) ✖︎ ".s.bright.fg.red + lMessage.cli.text)
        scriptError = .cmd(lMessage)
      case .compute:
        print(lBol + "\(lSpace) ⏱  " + lMessage.cli.text)
      case .build:
        print(lBol + "\(lSpace) ⚙️  " + lMessage.cli.text)
      case .action:
        print(lBol + "\(lSpace) ► ".fg.c256(31) + lMessage.fg.c256(81))
        Display.level += 1
      case .msg:
        print(lBol + "\(lSpace) ⇢ ".s.bright.fg.white + lMessage.cli.text)
      case .done:
        if Display.level > 0 {
          Display.level -= 1
          
          if lBol != "\n" {
            Display.lastAction = .compute
          }
        }
        
        if Display.level == 0 {
          if lMessage.isEmpty {
            lMessage = "done"
          }
          
          if error == nil || scriptError == .noerror {
            print(lBol + " ► ".fg.c256(228) + lMessage.cli.text + "\n\n")
          } else {
            print(lBol + " ► ".fg.c256(196) + lMessage.cli.text + "\n\n")
          }
        }
      }
    }
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
  
  internal class Option {
    public var short:String = ""
    public var long:String = ""
    public var variable:String = ""
    public var env:String = ""
    public var `default`:String? = nil
    public var value:String? = nil
    public var optional: Bool = true
    public var title:String = ""
    public var help:String = ""
    
    public init() {
    }
    
    public init(short pShort:String="", long pLong:String, variable pVariable:String="", env pEnv:String="", `default` pDefault:String?=nil, value pValue:String?=nil, optional pOptional:Bool=true,title pTitle:String, help pHelp:String="") {
      self.short = pShort
      self.long = pLong
      self.variable = pVariable
      self.env = pEnv
      self.default = pDefault
      self.value = pValue
      self.optional = pOptional
      self.title = pTitle
      self.help = pHelp
    }
  }
  
  internal class Cmd {
    public var name:String = ""
    public var variable:String? = nil
    public var title:String = ""
    public var help:String = ""
    public var handler:CmdHandler? = nil
    public var cmds:[Cmd]? = nil
    public var options:[Option] = []
    
    public init() {
    }
    
    public init(cmds pCmds:[Cmd]?) {
      self.cmds = pCmds
    }
    
    public init(name pName:String, variable pVariable:String? = nil, title pTitle:String, help pHelp:String = "", handler pHandler: CmdHandler? = nil) {
      self.name = pName
      self.variable = pVariable
      self.title = pTitle
      self.help = pHelp
      self.handler = pHandler
    }
  }
  
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
  
  private static var current:Cmd? = nil
  
  private static var cmds:[Cmd] = []
  
  private static var stack:[Cmd] = []
  
  // MARK: -> Private properties
  
  // MARK: -> Private class methods
  
  private class func eval(options pOptions:[Option], parameter pParameter:String, stack pStack: inout [String]) -> (option:Option, value:String?)? {
    var lRet:(Option,String?)? = nil
    
    for lOption in pOptions where lRet == nil {
      // Long option: --<option>, --<option>=<value> or --<option> <value>
      // Short option: -<option>, -<option>=<value> or -<option> <value>
      if (lOption.long.isEmpty == false && pParameter.hasPrefix("--" + lOption.long)) || (lOption.short.isEmpty == false && pParameter.hasPrefix("-" + lOption.short)) {
        var lValue:String? = lOption.default
        
        if pParameter.contains("=") {
          if let lLast = pParameter.components(separatedBy: "=").last {
            lValue = lLast
          }
        } else {
          if lValue != nil && pStack.count > 0 {
            let lArg = pStack[0]
            
            if !lArg.hasPrefix("-") && !lArg.hasPrefix("--") {
              lValue = pStack.removeFirst()
            }
          }
        }
        
        lRet = (option: lOption, value:lValue)
      }
      
      if pParameter == "--help" {
        lRet = (option:Option(long: "help", title: "current screen"), value:"true")
      }
    }
    
    return lRet
  }
  
  private class func help(cmd pCmd:Cmd, subcommands pSubcommands:Bool = true) {
    if pCmd.title.isEmpty == false {
      print("\n\(pCmd.title)\n".cli.text)
    }
    
    if pCmd.help.isEmpty == false {
      print("\n\(pCmd.help)\n".cli.text)
    } else {
      if pCmd.title.isEmpty {
        print("\n")
      }
    }
    
    if let lVariable = pCmd.variable {
      print("\nUsage:".cli.title + " \(pCmd.name) <\(lVariable)>\n".cli.text )
    }
    print("\n")
    
    var lSize = 0
    var lOptions = pCmd.options
    
    lOptions.append(Option(long: "help", title: "current screen"))
    
    let lHelp:(String, [Option]) -> Void = {
      pTitle, pOptions in
      
      print(pTitle)
      
      for lOption in pOptions {
        let lKeyColor = lOption.optional ? "".cli.option.key.optional : "".cli.option.key.required
        let lTextColor = lOption.optional ? "".cli.option.text.optional : "".cli.option.text.required
        
        var lDisplay = ""
        var lSizeOpt = 0
        
        lSizeOpt += lOption.long.count + 2
        
        if lOption.short.count > 0 {
          lSizeOpt += lOption.short.count + 2
          lDisplay += "\(lKeyColor)-\(lOption.short)" + ",".cli.text
        }
        
        lDisplay += lKeyColor
        lDisplay += "--\(lOption.long)"
        
        if let lValue = lOption.value {
          lDisplay += "=<\(lValue)>"
          lSizeOpt += lValue.count + 3
        }
        
        lDisplay += String(repeating: " ", count: lSize - lSizeOpt)
        lDisplay += "  \(lTextColor)\(lOption.title)"
        
        lDisplay = "  " + lDisplay
        
        print(lDisplay + "\n")
      }
    }
    
    for lOption in lOptions {
      var lOptSize:Int = lOption.long.count + 2
      
      if lOption.short.count > 0 {
        lOptSize += lOption.short.count + 2
      }
      
      if let lValue = lOption.value {
        lOptSize += lValue.count + 3
      }
      
      if lOptSize > lSize {
        lSize = lOptSize
      }
    }
    
    let lRequired = lOptions.filter({ $0.optional == false })
    let lOptional = lOptions.filter({ $0.optional == true })
    
    if lRequired.count > 0 {
      lHelp("Required".cli.title + ":\n".cli.text, lRequired)
      print("\n")
    }
    
    if lOptional.count > 0 {
      let lPlusrial = lOptional.count > 1 ? "s" : ""
      lHelp("Optional\(lPlusrial)".cli.title + ":\n".cli.text, lOptional)
      print("\n")
    }
    
    // List sub commands
    if let lCmds = pCmd.cmds, lCmds.count > 0 {
      var lSize = 0
      
      for lCmd in lCmds {
        var lCmdSize = lCmd.name.count
        
        if let lVariable = lCmd.variable {
          lCmdSize += lVariable.count + 3
        }
        
        if lCmdSize > lSize {
          lSize = lCmdSize
        }
      }
      
      if pSubcommands {
        print("Sub-commands".cli.title + ":\n".cli.text)
      } else {
        print("Commands".cli.title + ":\n".cli.text)
      }
      
      for lCmd in lCmds {
        var lDisplay = lCmd.name
        
        if let lVariable = lCmd.variable {
          lDisplay += " <\(lVariable)>"
        }
        
        let lNameSize = lDisplay.count
        
        lDisplay  = "  \(lDisplay)".cli.cmd
        lDisplay += String(repeating: " ", count: lSize - lNameSize)
        lDisplay += "  " + lCmd.title.cli.text + "\n"
        
        print(lDisplay)
      }
      
      print("\n")
    }
    
  }
  
  // MARK: -> Private init methods
  
  // MARK: -> Private operators
  
  // MARK: -> Private methods
  
}

