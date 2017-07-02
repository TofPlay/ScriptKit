import XCTest
@testable import ScriptKit

public func ==(_ pLhs: [String: Any], _ pRhs: [String: Any] ) -> Bool {
  return NSDictionary(dictionary: pLhs).isEqual(to: pRhs)
}

class ScriptKitTests: XCTestCase {
  static var allTests: [(String, (ScriptKitTests) -> () -> Void)] = [
    ("test_string_split", test_string_split),
    ("test_string_replace", test_string_replace),
    ("test_string_replace_regex", test_string_replace_regex),
    ("test_string_extract_regex", test_string_extract_regex),
    ("test_string_match_regex", test_string_match_regex),
    ("test_folder_environment_get", test_folder_environment_get),
    ("test_folder_environment_set", test_folder_environment_set),
    ("test_folder_homeDirectory", test_folder_homeDirectory),
    ("test_folder_tempDirectory", test_folder_tempDirectory),
    ("test_folder_desktopDirectory", test_folder_desktopDirectory),
    ("test_folder_documentDirectory", test_folder_documentDirectory),
    ("test_folder_applicationSupportDirectory", test_folder_applicationSupportDirectory),
    ("test_folder_cachesDirectory", test_folder_cachesDirectory),
    ("test_folder_exist", test_folder_exist),
    ("test_folder_isDir", test_folder_isDir),
    ("test_folder_mkdir", test_folder_mkdir),
    ("test_folder_mkdir_subfoler", test_folder_mkdir_subfoler),
    ("test_folder_rmdir", test_folder_rmdir),
    ("test_folder_copy_folder", test_folder_copy_folder),
    ("test_folder_move_folder", test_folder_move_folder),
    ("test_folder_chdir", test_folder_chdir),
    ("test_folder_workdir", test_folder_workdir),
    ("test_folder_norm", test_folder_norm),
    ("test_folder_dir", test_folder_dir),
    ("test_folder_name", test_folder_name),
    ("test_folder_ext", test_folder_ext),
    ("test_folder_abs", test_folder_abs),
    ("test_folder_writeReadFile", test_folder_writeReadFile),
    ("test_folder_writeReadLines", test_folder_writeReadLines),
    ("test_folder_copy_file", test_folder_copy_file),
    ("test_folder_move_file", test_folder_move_file),
    ("test_folder_size_file", test_folder_size_file),
    ("test_folder_file_permission", test_folder_file_permission),
    ("test_folder_file_chmod", test_folder_file_chmod),
    ("test_folder_file_owner", test_folder_file_owner),
    ("test_folder_file_group", test_folder_file_group),
    ("test_folder_file_chown_user", test_folder_file_chown_user),
    ("test_folder_file_chown_group", test_folder_file_chown_group),
    ("test_folder_symbolicLink", test_folder_symbolicLink),
    ("test_folder_hardLink", test_folder_hardLink),
    ("test_folder_glob", test_folder_glob),
    ("test_folder_whereis", test_folder_whereis),
    ("test_json_dictionary", test_json_dictionary),
    ("test_json_array", test_json_array),
    ("test_plist", test_plist),
    ("test_shell", test_shell),
    ]
  
  func test_string_split() {
    let lString = "Et animus ita eius insontium existimans aut insontium tener cogitatum "
    let lLines = lString.split(size: 10)
    var lShoudBeCount = lString.count / 10
    
    if (lString.count % 10) != 0 {
      lShoudBeCount += 1
    }
    
    XCTAssertTrue(lShoudBeCount == lLines.count, "Split string")
  }
  
  func test_string_replace() {
    let lString = "Et animus ita eius insontium existimans aut insontium tener cogitatum "
    let lValue = lString.replace(search: "existimans", with: "******")
    
    XCTAssertTrue(lValue == "Et animus ita eius insontium ****** aut insontium tener cogitatum ", "Search and replace a string")
  }
  
  func test_string_replace_regex() {
    let lString = "Et animus ita eius insontium existimans aut insontium tener cogitatum "
    let lValue = lString.replace(regEx: "(exis[^ ]*)", template: "******")
    
    XCTAssertTrue(lValue == "Et animus ita eius insontium ****** aut insontium tener cogitatum ", "Search and replace a string with a regex")
  }
  
  func test_string_extract_regex() {
    let lString = "Et animus ita eius insontium existimans aut insontium tener cogitatum "
    let lValue = lString.extract(regEx: " (e[^ ]*)")
    
    XCTAssertTrue(lValue.count == 2 && lValue[0] == "eius" && lValue[1] == "existimans", "Extract regex")
  }
  
  func test_string_match_regex() {
    let lString = "Et animus ita eius insontium existimans aut insontium tener cogitatum "
    let lValue = lString.match(regEx: "[\\w ]* existimans.*")
    
    XCTAssertTrue(lValue == true, "Regex \"[\\w ]* existimans.*\" must match \"\(lString)\"")
  }
  
  func test_folder_environment_get() {
    let lUser = ScriptKit.env["USER"]
    XCTAssertTrue(lUser != nil, "USER must be found")
  }
  
  func test_folder_environment_set() {
    let lOriginal = ScriptKit.env["USER"]
    ScriptKit.env["USER"] = "TofPlay"
    let lUser = ScriptKit.env["USER"]
    XCTAssertTrue(lUser == "TofPlay", "USER equal to 'TofPlay`")
    ScriptKit.env["USER"] = lOriginal
  }
  
  func test_folder_homeDirectory() {
    let lHomeDirectory = "/Users/" + ScriptKit.env["USER"]! + "/"
    XCTAssertTrue(ScriptKit.homeDirectory == lHomeDirectory, "ScriptKit.homeDirectory: \(ScriptKit.homeDirectory) != \(lHomeDirectory)")
  }
  
  func test_folder_tempDirectory() {
    XCTAssertTrue(ScriptKit.tempDirectory == NSTemporaryDirectory(), "ScriptKit.tempDirectory: \(ScriptKit.tempDirectory) != \(NSTemporaryDirectory())")
  }
  
  func test_folder_desktopDirectory() {
    let lDesktopDirectory = "/Users/" + ScriptKit.env["USER"]! + "/Desktop/"
    XCTAssertTrue(ScriptKit.desktopDirectory == lDesktopDirectory, "ScriptKit.desktopDirectory: \(ScriptKit.desktopDirectory) != \(lDesktopDirectory)")
  }
  
  func test_folder_documentDirectory() {
    let lDocumentsDirectory = "/Users/" + ScriptKit.env["USER"]! + "/Documents/"
    XCTAssertTrue(ScriptKit.documentDirectory == lDocumentsDirectory, "ScriptKit.documentDirectory: \(ScriptKit.documentDirectory) != \(lDocumentsDirectory)")
  }
  
  func test_folder_applicationSupportDirectory() {
    let lApplicationSupportDirectory = "/Users/" + ScriptKit.env["USER"]! + "/Library/Application Support/"
    XCTAssertTrue(ScriptKit.applicationSupportDirectory == lApplicationSupportDirectory, "ScriptKit.applicationSupportDirectory: \(ScriptKit.applicationSupportDirectory) != \(lApplicationSupportDirectory)")
  }
  
  func test_folder_cachesDirectory() {
    let lCachesDirectory = "/Users/" + ScriptKit.env["USER"]! + "/Library/Caches/"
    XCTAssertTrue(ScriptKit.cachesDirectory == lCachesDirectory, "ScriptKit.cachesDirectory: \(ScriptKit.cachesDirectory) != \(lCachesDirectory)")
  }
  
  func test_folder_exist() {
    XCTAssertTrue(ScriptKit.exist(path:ScriptKit.homeDirectory),"'\(ScriptKit.homeDirectory)' must be exist")
  }
  
  func test_folder_isDir() {
    XCTAssertTrue(ScriptKit.isDir(ScriptKit.homeDirectory),"'\(ScriptKit.homeDirectory)' must be a directory")
  }
  
  func test_folder_mkdir() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        
        if isDir(lTestDir) {
          rmdir(path: lTestDir)
        }
        
        XCTAssertTrue(mkdir(path: lTestDir) == true,"'\(lTestDir)' must be a directory")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_mkdir_subfoler() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/SubFolder/"
        
        XCTAssertTrue(mkdir(path: lTestDir, sub: true) == true,"'\(lTestDir)' must be a directory")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_rmdir() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        
        if exist(path: lTestDir) == false {
          mkdir(path: lTestDir)
        }
        
        XCTAssertTrue(rmdir(path: lTestDir) == true,"'\(lTestDir)' must be remove")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_copy_folder() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/Subfolder/"
        let lTargetDir = documentDirectory + "ScriptKit/Target/"
        
        rmdir(path: documentDirectory + "ScriptKit/")
        mkdir(path: lTestDir, sub: true)
        
        XCTAssertTrue(cp(path: lTestDir, to: lTargetDir),"Unable to copy \"\(lTestDir)\" to \"\(lTargetDir)\"")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_move_folder() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/Subfolder/"
        let lTargetDir = documentDirectory + "ScriptKit/Target/"
        
        rmdir(path: documentDirectory + "ScriptKit/")
        mkdir(path: lTestDir, sub: true)
        
        XCTAssertTrue(mv(at: lTestDir, to: lTargetDir),"Unable to move \"\(lTestDir)\" to \"\(lTargetDir)\"")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_chdir() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        
        XCTAssertTrue(chdir(path: lTestDir) == true,"Unable to change current directory to '\(lTestDir)'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_workdir() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        
        chdir(path: lTestDir)
        XCTAssertTrue(workdir() == lTestDir, "Current directory must be '\(lTestDir)'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_norm() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTestSubDir = lTestDir + "TestFolder/"
        
        rmdir(path: lTestDir)
        mkdir(path: lTestSubDir, sub: true)
        chdir(path: lTestSubDir)
        
        let lHomePath = norm(path: "~/Documents/")
        
        XCTAssertTrue(lHomePath == documentDirectory, "Normalized path must be '\(documentDirectory)'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_dir() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTestSubDir = lTestDir + "TestFolder/"
        let lTestFile1 = lTestSubDir + "File.txt"
        let lTestFile2 = "File3.txt"
        let lTestFile3 = "Test1[1-9]\\.txt"
        
        XCTAssertTrue(dir(path: lTestSubDir) == lTestDir, "Must be return '\(lTestDir)'")
        XCTAssertTrue(dir(path: lTestFile1) == lTestSubDir, "Must be return '\(lTestSubDir)'")
        XCTAssertTrue(dir(path: lTestFile2) == "", "Must be return ''")
        XCTAssertTrue(dir(path: lTestFile3) == "", "Must be return ''")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_name() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTestSubDir = lTestDir + "TestFolder/"
        let lTestFile = lTestSubDir + "File.txt"
        let lTestFile2 = "File3.txt"
        let lTestFile3 = "Test1[1-9]\\.txt"
        
        XCTAssertTrue(name(path: lTestSubDir) == "TestFolder", "Must be return'TestFolder'")
        XCTAssertTrue(name(path: lTestFile) == "File", "Must be return'File.txt'")
        XCTAssertTrue(name(path: lTestFile2) == "File3", "Must be return'File3'")
        XCTAssertTrue(name(path: lTestFile3) == "Test1[1-9]", "Must be return'Test1[1-9]'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_ext() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTestSubDir = lTestDir + "TestFolder/"
        let lTestFile = lTestSubDir + "File.txt"
        
        XCTAssertTrue(ext(path: lTestSubDir) == "", "Must be ''")
        XCTAssertTrue(ext(path: lTestFile) == "txt", "Must be return 'txt'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_abs() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTestSubDir = lTestDir + "TestFolder/"
        
        rmdir(path: lTestDir)
        mkdir(path: lTestSubDir, sub: true)
        
        chdir(path: lTestSubDir)
        
        let lAbsPath = abs(path: "../")
        
        XCTAssertTrue(lAbsPath == lTestDir, "Absolute path must be '\(lTestDir)'")
        
        let lHomePath = abs(path: "~/Documents/")
        
        XCTAssertTrue(lHomePath == documentDirectory, "Absolute path must be '\(documentDirectory)'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_writeReadFile() {
    class ScriptTest : ScriptKit {
      public class func run() {
        var lOk = false
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTextFile = lTestDir + "Test.txt"
        let lString = "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat."
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        
        lOk = writeText(file: lTextFile, string: lString)
        
        if lOk == true {
          if let lReadText = readText(file: lTextFile), lString == lReadText {
            lOk = true
          }
        }
        
        XCTAssertTrue(lOk == true, "Unable to write and read '\(lTextFile)'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_writeReadLines() {
    class ScriptTest : ScriptKit {
      public class func run() {
        var lOk = false
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTextFile = lTestDir + "Test.txt"
        let lLines = """
          Et prima post Osdroenam quam, ut dictum est, ab
          Quam ob rem ut ii qui superiores sunt submittere
          Orientis vero limes in longum protentus et rectum
          Sed si ille hac tam eximia fortuna propter
          Ipsam vero urbem Byzantiorum fuisse refertissimam
        """.components(separatedBy: "\n")
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        
        lOk = writeText(file: lTextFile, lines: lLines)
        
        if lOk == true {
          if let lReadLines = readLines(file: lTextFile), lLines == lReadLines {
            lOk = true
          }
        }
        
        XCTAssertTrue(lOk == true, "Unable to write and read '\(lTextFile)'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_copy_file() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTextFile = lTestDir + "Test.txt"
        let lCopyFile = lTestDir + "Copy.txt"
        let lString = "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat."
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        writeText(file: lTextFile, string: lString)
        cp(path: lTextFile, to: lCopyFile)
        let lCopy = readText(file: lCopyFile)
        
        XCTAssertTrue(lCopy == lString, "Unable to copy '\(lTextFile)' to '\(lCopyFile)'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_move_file() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTextFile = lTestDir + "Test.txt"
        let lMoveFile = lTestDir + "Move.txt"
        let lString = "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat."
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        writeText(file: lTextFile, string: lString)
        mv(at: lTextFile, to: lMoveFile)
        let lMove = readText(file: lMoveFile)
        
        XCTAssertTrue(lMove == lString, "Unable to move '\(lTextFile)' to '\(lMoveFile)'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_size_file() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTextFile = lTestDir + "Test.txt"
        let lString = "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat."
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        writeText(file: lTextFile, string: lString)
        
        let lSizeString = UInt64(lString.count)
        let lSizeFile = size(file: lTextFile)
        
        XCTAssertTrue(lSizeFile == lSizeString, "Size file and size string must be equal")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_file_permission() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTextFile = lTestDir + "Test.txt"
        let lString = "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat."
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        writeText(file: lTextFile, string: lString)
        
        let lPermission = permissions(path: lTextFile)
        
        XCTAssertTrue(lPermission == 644, "Permission of '\(lTextFile)' must be equal to 644")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_file_chmod() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTextFile = lTestDir + "Test.txt"
        let lString = "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat."
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        writeText(file: lTextFile, string: lString)
        
        chmod(path: lTextFile, value: 444)
        let lPermission = permissions(path: lTextFile)
        
        XCTAssertTrue(lPermission == 444, "Permission of '\(lTextFile)' must be equal to 644")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_file_owner() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTextFile = lTestDir + "Test.txt"
        let lString = "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat."
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        writeText(file: lTextFile, string: lString)
        
        let lUser = env["USER"] ?? ""
        let lOwner = owner(path: lTextFile)
        
        XCTAssertTrue(lOwner == lUser, "Owner of '\(lTextFile)' must be equal to '\(lUser)'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_file_group() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTextFile = lTestDir + "Test.txt"
        let lString = "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat."
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        writeText(file: lTextFile, string: lString)
        
        let lGroup = group(path: lTextFile)
        
        XCTAssertTrue(lGroup == "staff", "Group of '\(lTextFile)' must be equal to 'staff'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_file_chown_user() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTextFile = lTestDir + "Test.txt"
        let lString = "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat."
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        writeText(file: lTextFile, string: lString)
        
        XCTAssertTrue(chown(path: lTextFile,owner: "root") == false, "Unable to set owner 'root' to '\(lTextFile)'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_file_chown_group() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTextFile = lTestDir + "Test.txt"
        let lString = "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat."
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        writeText(file: lTextFile, string: lString)
        
        XCTAssertTrue(chown(path: lTextFile, group: "everyone") == true, "Unable to set owner 'root' to '\(lTextFile)'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_symbolicLink() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTextFile = lTestDir + "Test.txt"
        let lLinkFile = lTestDir + "Link.txt"
        let lString = "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat."
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        writeText(file: lTextFile, string: lString)
        
        XCTAssertTrue(isLink(lTextFile) == false , "File '\(lTextFile)' is not a link")
        XCTAssertTrue(link(symbolic: lLinkFile, path: lTextFile) == true, "Unable to create the link '\(lLinkFile)'")
        XCTAssertTrue(isLink(lLinkFile) == true , "File '\(lLinkFile)' must be a link")
        XCTAssertTrue(abs(symbolicLink: lLinkFile) == lTextFile , "Link '\(lLinkFile)' must have '\(lTextFile)' as a target")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_hardLink() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lTextFile = lTestDir + "Test.txt"
        let lLinkFile = lTestDir + "Link.txt"
        let lString = "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat."
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)
        writeText(file: lTextFile, string: lString)
        
        XCTAssertTrue(link(hard: lLinkFile, path: lTextFile) == true, "Unable to create an hard link from '\(lTextFile)' to '\(lLinkFile)'")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_glob() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lString = "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat."
        var lDataAll:[String] = []
        var lDataLast5:[String] = []
        
        rmdir(path: lTestDir)
        
        for lI1 in 1...15 {
          let lTestDirSub = "\(lTestDir)Subdir\(lI1)/"
          mkdir(path: lTestDirSub, sub: true)
          
          lDataAll.append(lTestDirSub)
          
          for lI2 in 1...15 {
            let lTextFile = "\(lTestDirSub)Test\(lI2).txt"
            writeText(file: lTextFile, string: lString)
            
            lDataAll.append(lTextFile)
            
            if lI2 > 10 {
              lDataLast5.append(lTextFile)
            }
          }
        }
        
        chdir(path: lTestDir)
        
        let lGlobAll = glob(path: ".", recursive: true, absPath: true)
        let lGlbLast5 = glob(path: "Test1[1-9]\\.txt", recursive: true, absPath: true)
        
        XCTAssertTrue(lGlobAll == lDataAll, "Generate directories and files must be present")
        XCTAssertTrue(lGlbLast5 == lDataLast5, "Generate directories and files must be present")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_folder_whereis() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lPathBash = whereis("bash")
        XCTAssertTrue(lPathBash == "/bin/bash", "Must be found 'bash' at '/bin/bash/")
      }
    }
    
    ScriptTest.run()
  }
  
  func test_json_dictionary() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lDictionary:[String:Any] = ["id": 1, "firstName" : "John", "lastName" : "Doe"]
        let lData = dictionary2json(lDictionary)
        
        XCTAssertTrue(lData != nil, "Data must be not nil")
        
        if lData != nil {
          let lResult = json2dictionary(lData!)
          XCTAssertTrue(lDictionary == lResult, "Result must be equal to Dictionary")
        }
      }
    }
    
    ScriptTest.run()
  }
  
  func test_json_array() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lArray:[String] = ["id", "firstName", "lastName"]
        let lData = array2json(lArray)
        
        XCTAssertTrue(lData != nil, "Data must be not nil")
        
        if lData != nil {
          let lResult = json2array(lData!)
          XCTAssertTrue(lArray == lResult as! [String], "Result must be equal to Array")
        }
      }
    }
    
    ScriptTest.run()
  }
  
  func test_plist() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lDictionary:[String:Any] = ["id": 1, "firstName" : "John", "lastName" : "Doe"]
        let lData = dictionary2plist(lDictionary)
        
        XCTAssertTrue(lData != nil, "Data must be not nil")
        
        if lData != nil {
          let lResult = plist2dictionary(lData!)
          XCTAssertTrue(lDictionary == lResult, "Result must be equal to Dictionary")
        }
      }
    }
    
    ScriptTest.run()
  }
  
  func test_shell() {
    class ScriptTest : ScriptKit {
      public class func run() {
        let lTestDir = documentDirectory + "ScriptKit/"
        let lString = "Quare hoc quidem praeceptum, cuiuscumque est, ad tollendam amicitiam valet; illud potius praecipiendum fuit, ut eam diligentiam adhiberemus in amicitiis comparandis, ut ne quando amare inciperemus eum, quem aliquando odisse possemus. Quin etiam si minus felices in diligendo fuissemus, ferendum id Scipio potius quam inimicitiarum tempus cogitandum putabat."
        var lFiles:[String] = []
        
        rmdir(path: lTestDir)
        mkdir(path: lTestDir, sub: true)

        for lI in 1...15 {
          let lTextFile = "\(lTestDir)Test\(lI).txt"
          writeText(file: lTextFile, string: lString)
          lFiles.append("Test\(lI).txt")
        }
        
        chdir(path: lTestDir)
        
        let lShell = Shell()
        var lLines:[String] = []
        
        lShell.run("ls -l") {
          pLine in
          lLines.append(pLine)
        }
        
        let lExit = lShell.wait()
        
        XCTAssertTrue(lExit == 0, "Must be able to execute 'ls -l'")
        
        let lOutput = lLines.joined(separator: "\n")
        var lFounds:[String] = []
        
        for lFile in lFiles {
          if lOutput.contains(lFile) {
            lFounds.append(lFile)
          }
        }
        
        XCTAssertTrue(lFiles == lFounds, "Must found all files")
      }
    }
    
    ScriptTest.run()
  }
}

