//
//  String+ScriptKit.swift
//  XcodeTool
//
//  Created by Christophe Braud on 11/06/2017.
//  Base on Tof Templates (https://bit.ly/2OWAgmb)
//  Copyright © 2017 Christophe Braud. All rights reserved.
//

import Foundation

/// String exention for ANSI code for command line tool
extension String {
  
  /// Alias colors for command line appliations
  public struct Cli {
    
    /// Color bright and blue for command option.cmd
    public var cmd:String {
      return "".s.reset +  self.string.fg.c256(33)
    }
    
    /// Alias colors for option
    public struct Option {
      
      /// Alias colors for option.key
      public struct Key {
        
        /// Alias colors for option.key.optional
        public var optional:String {
          return "".s.reset + self.string.fg.c256(34)
        }
        
        /// Alias colors for option.key.required
        public var required:String {
          return "".s.reset + self.string.s.bright.fg.c256(120)
        }
        
        private let string: String
        
        public init(string pString:String) {
          self.string = pString
        }
      }
      
      /// Alias colors for command option.text
      public struct Text {
        
        /// Alias colors for option.text.optional
        public var optional:String {
          return "".s.reset + self.string.fg.white
        }
        
        /// Alias colors for option.text.required
        public var required:String {
          return "".s.reset + self.string.s.bright.fg.white
        }
        
        private let string: String
        
        public init(string pString:String) {
          self.string = pString
        }
      }
      
      private let string: String
      
      /// Color for the key
      public var key:Key {
        return Key(string: self.string)
      }
      
      /// Color for the text
      public var text:Text {
        return Text(string: self.string)
      }
      
      public init(string pString:String) {
        self.string = pString
      }
    }
    
    /// Access to option colors
    public var option:Option {
      return Option(string: self.string)
    }
    
    /// Color bright and blue for command option.cmd
    public var title:String {
      return "".s.reset + self.string.s.bright.s.underscore.fg.white
    }
    
    /// Color white for normal texts
    public var text:String {
      return "".s.reset + self.string.fg.white
    }
    
    /// Color for errors
    public var error:String {
      return "".s.reset + self.string.fg.c256(160)
    }
    
    /// Color for warnings
    public var warning:String {
      return "".s.reset + self.string.fg.c256(147)
    }
    
    /// Color for info
    public var info:String {
      return "".s.reset + self.string.fg.c256(228)
    }
    
    /// Color for `Copyright`
    public var copyright:String {
      return "".s.reset + self.string.fg.white
    }
    
    /// Color for `year`
    public var year:String {
      return "".s.reset + self.string.s.bright.fg.white
    }
    
    /// Color for the owner
    public var owner:String {
      return "".s.reset + self.string.s.bright.fg.white
    }
    
    /// Color for the version
    public var version:String {
      return "".s.reset + self.string.fg.white
    }
    
    public var nversion:String {
      return "".s.reset + self.string.s.bright.fg.white
    }
    
    private let string: String
    
    public init(string pString:String) {
      self.string = pString
    }
  }
  
  /// Access to `cmd`, `option`, `title`, `text`, `error`, `info`, `copyright` and `year`
  public var cli:Cli {
    return Cli(string: self)
  }
  
}

