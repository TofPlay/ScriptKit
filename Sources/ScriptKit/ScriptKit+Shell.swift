//
//  ScriptKit+Shell.swift
//  ScriptKit
//
//  Created by Christophe Braud on 18/06/2017.
//  Base on Tof Templates (https://goo.gl/GdyFiw)
//  Copyright © 2017 Christophe Braud. All rights reserved.
//

import Foundation

// MARK: -
// MARK: Shell extension
// MARK: -
/// ScriptKit extension for Shell
extension ScriptKit {
  // MARK: -
  // MARK: ScriptKit.Shell
  // MARK: -
  
  /// Manage the shell to execute some others applications
  public class Shell {
    // MARK: -
    // MARK: Public access
    // MARK: -
    
    // MARK: -> Public enums
    
    // MARK: -> Public structs
    
    // MARK: -> Public class
    
    // MARK: -> Public type alias
    
    public typealias Readline = (String) -> Void
    
    // MARK: -> Public static properties
    
    // MARK: -> Public properties
    
    // XT: Properties
    
    /// Last command
    public var command:String = ""
    
    /// Separator
    public var separator:String = "\r\n"

    /// Exit value of the external process
    public var exit:Int32 = 0
    
    /// Standard output
    public var stdout:[String] = []

    /// Standard error
    public var stderr:[String] = []

    /// Check if the shell is running
    public var isRunning:Bool {
      var lRet = false
      
      if let lProcess = self.process {
        lRet = lProcess.isRunning
      }
      
      return lRet
    }
    
    // MARK: -> Public class methods
    
    // MARK: -> Public init methods
    
    // XT: Construstor
    
    public init() {
    }
    
    /// Constructor with de command
    ///
    /// Like:
    /// ```
    /// ls -l /Users
    /// ```
    ///
    /// - Parameter:
    ///   - pCommand: Command
    public init(_ pCommand:String) {
      self.command = pCommand
    }
    
    // MARK: -> Public operators
    
    // MARK: -> Public methods
    
    // XT: Methods
    
    /// Execute some command in the shell
    ///
    /// Example:
    /// ```
    /// /bin/sh -c "<instructions>"
    /// ```
    /// You catch stdout and stderr with an handler. And you can adjust the speed by setting the size of the buffer.
    /// If your buffer is too big you will receive multiple lines in one time and you can not display the line it's comming.
    /// It's why by default the size is set to 80 bytes. It's almost the size of one line in the screen.
    ///
    /// - Parameters:
    ///   - pCmd: Commands execute by the shell
    ///   - pSize: Size of the cache. The handler is call when the cache is full.
    ///   - pSeperator: Characters to cut the buffer in lines
    ///   - pReadLine: Handler call for each line receive
    /// - Returns: the object for chainning
    @discardableResult
    public func run(_ pCmd:String? = nil, size pSize:Int=80, seperator pSeperator:String = "\r\n", readLine pReadLine:Readline? = nil) -> Self {
      let lProcess = Process()
      
      if let lCmd = pCmd {
        self.command = lCmd
      }
      
      let lPipeOut = Pipe()
      let lPipeErr = Pipe()
      
      lProcess.launchPath = "/bin/sh"
      lProcess.arguments = ["-c", self.command]
      lProcess.environment = ScriptKit.env.current
      lProcess.currentDirectoryPath = ScriptKit.workdir()
      lProcess.standardOutput = lPipeOut
      lProcess.standardError = lPipeErr
      
      self.terminate()
      self.process = lProcess
      
      if let lReadLine = pReadLine {
        self.isReadingOut = true
        self.isReadingOut = true
        
        var lCacheOut = ""
        var lCacheErr = ""
        
        let lReadData:(DispatchData?, inout String) -> Void = {
          pDispatchData, pCache in
          
          if let lDispatchData = pDispatchData {
            let lCount = lDispatchData.count
            var lBytes = [UInt8](repeating:0, count: lCount)
            
            lBytes.withUnsafeMutableBytes {
              lDispatchData.copyBytes(to: $0, count: lCount)
            }
            
            let lData = Data(bytes: lBytes, count: lCount)
            
            if lData.count == 0 {
              if pCache.isEmpty == false {
                lReadLine(pCache)
              }
            } else {
              let lString = pCache + (String(data: lData, encoding: String.Encoding.utf8) ?? "")
              var lLines = lString.components(separatedBy: CharacterSet.init(charactersIn: pSeperator))
              let lLastChar = lString[lString.index(before: lString.endIndex)]
              
              if let lLast = lLines.last, pSeperator.contains(lLastChar) == false {
                pCache = lLast
                lLines.removeLast()
              } else {
                pCache = ""
              }
              
              for lLine in lLines {
                DispatchQueue.main.async {
                  lReadLine(lLine)
                }
              }
            }
          }
        }
        
        let lDispatchOut = DispatchIO(type: .stream, fileDescriptor: lPipeOut.fileHandleForReading.fileDescriptor, queue: Shell.queue, cleanupHandler: {
          _ in
          
          self.isReadingOut = false
        })
        
        lDispatchOut.setLimit(lowWater: 1)
        lDispatchOut.setLimit(highWater: pSize)
        
        lDispatchOut.read(offset: 0, length: Int.max, queue: Shell.queue) {
          pDone, pDispatchData, pError in
          
          lReadData(pDispatchData, &lCacheOut)
        }
        
        lDispatchOut.resume()
        
        let lDispatchErr = DispatchIO(type: .stream, fileDescriptor: lPipeErr.fileHandleForReading.fileDescriptor, queue: Shell.queue, cleanupHandler: {
          _ in
          
          self.isReadingErr = false
        })
        
        lDispatchErr.setLimit(lowWater: 1)
        lDispatchErr.setLimit(highWater: pSize)
        
        lDispatchErr.read(offset: 0, length: Int.max, queue: Shell.queue) {
          pDone, pDispatchData, pError in
          
          lReadData(pDispatchData, &lCacheErr)
        }
        
        lDispatchErr.resume()
      } else {
        self.isReadingOut = false
        self.isReadingErr = false
      }
      
      lProcess.launch()
        
      return self
    }
    
    /// Wait until the shell is finished processing the instructions
    ///
    /// That also expects that we are finished reading the data on stdout and stderr.
    ///
    /// - Returns: exit status returned by the receiver’s shell.
    @discardableResult
    public func wait() -> Int32 {
      var lRet:Int32 = -1
      
      if let lProcess = self.process {
        
        // Don't use waitUntilExit() because this method return before we read alls data in stdout and stderr
        while(self.isReadingOut || self.isReadingErr || lProcess.isRunning) {
          RunLoop.current.run(mode:RunLoopMode.defaultRunLoopMode, before: Date())
          usleep(10)
        }

        if let lPipeOut = lProcess.standardOutput as? Pipe {
          let lData = lPipeOut.fileHandleForReading.readDataToEndOfFile()
          self.stdout = (String(data: lData, encoding: String.Encoding.utf8) ?? "").components(separatedBy: CharacterSet.init(charactersIn: self.separator))
        }
        
        if let lPipeErr = lProcess.standardError as? Pipe {
          let lData = lPipeErr.fileHandleForReading.readDataToEndOfFile()
          self.stderr = (String(data: lData, encoding: String.Encoding.utf8) ?? "").components(separatedBy: CharacterSet.init(charactersIn: self.separator))
        }
        
        self.exit = lProcess.terminationStatus
        lRet = self.exit
        self.process = nil
      }
      
      return lRet
    }
    
    /// Suspends execution of the receiver task.
    ///
    /// Multiple suspend() messages can be sent, but they must be balanced with an equal number of resume() messages before the task resumes execution.
    ///
    /// - Returns: `true` if the receiver was successfully suspended, `false` otherwise.
    public func suspend() -> Bool {
      var lRet = false
      
      if let lProcess = self.process {
        lRet = lProcess.suspend()
      }
      
      return lRet
    }
    
    /// Resumes execution of the receiver task
    ///
    /// The task had previously been suspended with a `suspend()` method.
    /// If multiple `suspend()` method were sent to the receiver, an equal number of `resume()` messages must be sent before the task resumes execution.
    ///
    /// - Returns: `true` if the receiver was able to resume execution, `false` otherwise.
    public func resume() -> Bool {
      var lRet = false
      
      if let lProcess = self.process {
        lRet = lProcess.resume()
      }
      
      return lRet
    }
    
    /// Sends an interrupt signal to the receiver and all of its subtasks.
    public func interrupt() {
      if let lProcess = self.process {
        lProcess.interrupt()
        self.exit = lProcess.terminationStatus
        self.process = nil
      }
    }
    
    /// Sends a terminate signal to the receiver and all of its subtasks.
    public func terminate() {
      if let lProcess = self.process {
        lProcess.terminate()
        self.exit = lProcess.terminationStatus
        self.process = nil
      }
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
    
    private static var queue: DispatchQueue = DispatchQueue(label: "ScriptKit.Shell")
    
    // MARK: -> Private properties
    
    private var process:Process? = nil
    private var isReadingOut:Bool = false
    private var isReadingErr:Bool = false
    
    // MARK: -> Private class methods
    
    // MARK: -> Private init methods
    
    // MARK: -> Private operators
    
    // MARK: -> Private methods
    
  }
}
