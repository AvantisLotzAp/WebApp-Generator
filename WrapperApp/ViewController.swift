//
//  ViewController.swift
//  WrapperApp
//
//  Created by LIPL-227 on 09/03/22.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var resultLabel: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
        
            //git clone https://CPPATIDAR@bitbucket.org/CPPATIDAR/wrapperapp-lotzapp.git
        
            try shellOut(to: .createFolder(named: "folder"))
            let output =    try shellOut(to: .createFile(named: "file", contents: "Hello world"))
            /*
            let outputbranch =  try shellOut(to: "git branch")
            print(outputbranch)
            print(outputbranch)
            //try shellOut(to: .gitInit())
            try shellOut(to: .gitClone(url: URL(string: "https://CPPATIDAR@bitbucket.org/CPPATIDAR/wrapperapp-lotzapp.git")! ))
            try shellOut(to: .gitCommit(message: "A scripted commit!"))
            try shellOut(to: .gitPush())
            //try shellOut(to: .gitPull(remote: "origin", branch: "release"))
           // try shellOut(to: .gitSubmoduleUpdate())
            let output =  try shellOut(to: .gitCheckout(branch: "my-feature"))
            */
            //let output = try shellOut(to: .runFastlane(usingLane: "appstore"))
            //print(output) // Hello again
            
            resultLabel.stringValue = "\(output)"
        }  catch {
                print("\(error)") //handle or silence the error here
            resultLabel.stringValue = "\(error)"
            }
        /*
        do {
         let command_firstVal =   try self.safeShell("pwd")
            print(command_firstVal)
            print(command_firstVal)
            resultLabel.stringValue = "\(command_firstVal)"
            let val =   try self.safeShell("ls")
               print(val)
               print(val)
               resultLabel.stringValue = "\(val)"
        } catch {
            print("\(error)") //handle or silence the error here
        }
        */
        

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
/*
    func safeShell(_ command: String) throws -> String {
          let task = Process()
          let pipe = Pipe()
          
          task.standardOutput = pipe
          task.standardError = pipe
          task.arguments = ["-c", command]
          task.executableURL = URL(fileURLWithPath: "/bin/zsh") //<--updated

          try task.run() //<--updated
          
          let data = pipe.fileHandleForReading.readDataToEndOfFile()
          let output = String(data: data, encoding: .utf8)!
          
          return output
      }
    */
}

