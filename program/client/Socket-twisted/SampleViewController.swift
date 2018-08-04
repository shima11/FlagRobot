//
//  ViewController.swift
//  ChatClientSwift
//
//  Created by Kj Drougge on 2014-12-12.
//  Copyright (c) 2014 kj. All rights reserved.
//

import UIKit


class SampleViewController: UIViewController, NSStreamDelegate {
    
    //portの指定
    private let serverPort: UInt32 = 7777
    
    private var inputStream101: NSInputStream!
    private var outputStream101: NSOutputStream!
    private var inputStream102: NSInputStream!
    private var outputStream102: NSOutputStream!
    private var inputStream103: NSInputStream!
    private var outputStream103: NSOutputStream!
    private var inputStream104: NSInputStream!
    private var outputStream104: NSOutputStream!
    private var inputStream105: NSInputStream!
    private var outputStream105: NSOutputStream!
    private var inputStream106: NSInputStream!
    private var outputStream106: NSOutputStream!
    private var inputStream107: NSInputStream!
    private var outputStream107: NSOutputStream!
    private var inputStream108: NSInputStream!
    private var outputStream108: NSOutputStream!
    private var inputStream109: NSInputStream!
    private var outputStream109: NSOutputStream!
    private var inputStream110: NSInputStream!
    private var outputStream110: NSOutputStream!
    
    //接続が完了したかどうかのフラグ
    var isFlag1 : Bool = false
    var isFlag2 : Bool = false
    var isFlag3 : Bool = false
    var isFlag4 : Bool = false
    var isFlag5 : Bool = false
    var isFlag6 : Bool = false
    var isFlag7 : Bool = false
    var isFlag8: Bool = false
    var isFlag9 : Bool = false
    var isFlag10 : Bool = false
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //接続を開始
        initNetworkCommunication101("imailab101.local")
        initNetworkCommunication102("imailab102.local")
        initNetworkCommunication103("imailab103.local")
        initNetworkCommunication104("imailab104.local")
        initNetworkCommunication105("imailab105.local")
        initNetworkCommunication106("imailab106.local")
        initNetworkCommunication107("imailab107.local")
        initNetworkCommunication108("imailab108.local")
        initNetworkCommunication109("imailab109.local")
        initNetworkCommunication110("imailab110.local")
        
        button1.enabled = false
        button2.enabled = false
        button3.enabled = false
        button4.enabled = false
        button5.enabled = false
        button6.enabled = false
        button7.enabled = false
        button8.enabled = false
        button9.enabled = false
        button10.enabled = false
        
    }
    
    
    //全ての旗を動かす
    @IBAction func startAction(sender: AnyObject) {
        action("start")
    }

    @IBAction func hata1Action(sender: AnyObject) {
        let data:NSData = "start".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        _ = self.outputStream101!.write(UnsafePointer(data.bytes), maxLength: data.length)
    }
    @IBAction func hata2Action(sender: AnyObject) {
        let data:NSData = "start".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        _ = self.outputStream102!.write(UnsafePointer(data.bytes), maxLength: data.length)
    }
    @IBAction func hata3Action(sender: AnyObject) {
        let data:NSData = "start".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        _ = self.outputStream103!.write(UnsafePointer(data.bytes), maxLength: data.length)
    }
    @IBAction func hata4Action(sender: AnyObject) {
        let data:NSData = "start".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        _ = self.outputStream104!.write(UnsafePointer(data.bytes), maxLength: data.length)
    }
    @IBAction func hata5Action(sender: AnyObject) {
        let data:NSData = "start".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        _ = self.outputStream105!.write(UnsafePointer(data.bytes), maxLength: data.length)
    }
    @IBAction func hata6Action(sender: AnyObject) {
        let data:NSData = "start".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        _ = self.outputStream106!.write(UnsafePointer(data.bytes), maxLength: data.length)
    }
    @IBAction func hata7Action(sender: AnyObject) {
        let data:NSData = "start".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        _ = self.outputStream107!.write(UnsafePointer(data.bytes), maxLength: data.length)
    }
    @IBAction func hata8Action(sender: AnyObject) {
        let data:NSData = "start".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        _ = self.outputStream108!.write(UnsafePointer(data.bytes), maxLength: data.length)
    }
    @IBAction func hata9Action(sender: AnyObject) {
        let data:NSData = "start".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        _ = self.outputStream109!.write(UnsafePointer(data.bytes), maxLength: data.length)
    }
    @IBAction func hata10Action(sender: AnyObject) {
        let data:NSData = "start".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        _ = self.outputStream110!.write(UnsafePointer(data.bytes), maxLength: data.length)
    }

    func initNetworkCommunication101(serverid: CFString){
        
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(nil, serverid, self.serverPort, &readStream, &writeStream)
        
        self.inputStream101 = readStream!.takeRetainedValue()
        self.outputStream101 = writeStream!.takeRetainedValue()
        
        self.inputStream101.delegate = self
        self.outputStream101.delegate = self
        
        self.inputStream101.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        self.outputStream101.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        
        self.inputStream101.open()
        self.outputStream101.open()
    }
    func initNetworkCommunication102(serverid: CFString){
        
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(nil, serverid, self.serverPort, &readStream, &writeStream)
        
        self.inputStream102 = readStream!.takeRetainedValue()
        self.outputStream102 = writeStream!.takeRetainedValue()
        
        self.inputStream102.delegate = self
        self.outputStream102.delegate = self
        
        self.inputStream102.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        self.outputStream102.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        
        self.inputStream102.open()
        self.outputStream102.open()
    }
    func initNetworkCommunication103(serverid: CFString){
        
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(nil, serverid, self.serverPort, &readStream, &writeStream)
        
        self.inputStream103 = readStream!.takeRetainedValue()
        self.outputStream103 = writeStream!.takeRetainedValue()
        
        self.inputStream103.delegate = self
        self.outputStream103.delegate = self
        
        self.inputStream103.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        self.outputStream103.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        
        self.inputStream103.open()
        self.outputStream103.open()
    }
    func initNetworkCommunication104(serverid: CFString){
        
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(nil, serverid, self.serverPort, &readStream, &writeStream)
        
        self.inputStream104 = readStream!.takeRetainedValue()
        self.outputStream104 = writeStream!.takeRetainedValue()
        
        self.inputStream104.delegate = self
        self.outputStream104.delegate = self
        
        self.inputStream104.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        self.outputStream104.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        
        self.inputStream104.open()
        self.outputStream104.open()
    }
    func initNetworkCommunication105(serverid: CFString){
        
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(nil, serverid, self.serverPort, &readStream, &writeStream)
        
        self.inputStream105 = readStream!.takeRetainedValue()
        self.outputStream105 = writeStream!.takeRetainedValue()
        
        self.inputStream105.delegate = self
        self.outputStream105.delegate = self
        
        self.inputStream105.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        self.outputStream105.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        
        self.inputStream105.open()
        self.outputStream105.open()
    }
    func initNetworkCommunication106(serverid: CFString){
        
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(nil, serverid, self.serverPort, &readStream, &writeStream)
        
        self.inputStream106 = readStream!.takeRetainedValue()
        self.outputStream106 = writeStream!.takeRetainedValue()
        
        self.inputStream106.delegate = self
        self.outputStream106.delegate = self
        
        self.inputStream106.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        self.outputStream106.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        
        self.inputStream106.open()
        self.outputStream106.open()
    }
    func initNetworkCommunication107(serverid: CFString){
        
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(nil, serverid, self.serverPort, &readStream, &writeStream)
        
        self.inputStream107 = readStream!.takeRetainedValue()
        self.outputStream107 = writeStream!.takeRetainedValue()
        
        self.inputStream107.delegate = self
        self.outputStream107.delegate = self
        
        self.inputStream107.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        self.outputStream107.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        
        self.inputStream107.open()
        self.outputStream107.open()
    }
    func initNetworkCommunication108(serverid: CFString){
        
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(nil, serverid, self.serverPort, &readStream, &writeStream)
        
        self.inputStream108 = readStream!.takeRetainedValue()
        self.outputStream108 = writeStream!.takeRetainedValue()
        
        self.inputStream108.delegate = self
        self.outputStream108.delegate = self
        
        self.inputStream108.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        self.outputStream108.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        
        self.inputStream108.open()
        self.outputStream108.open()
    }
    func initNetworkCommunication109(serverid: CFString){
        
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(nil, serverid, self.serverPort, &readStream, &writeStream)
        
        self.inputStream109 = readStream!.takeRetainedValue()
        self.outputStream109 = writeStream!.takeRetainedValue()
        
        self.inputStream109.delegate = self
        self.outputStream109.delegate = self
        
        self.inputStream109.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        self.outputStream109.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        
        self.inputStream109.open()
        self.outputStream109.open()
    }
    func initNetworkCommunication110(serverid: CFString){
        
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(nil, serverid, self.serverPort, &readStream, &writeStream)
        
        self.inputStream110 = readStream!.takeRetainedValue()
        self.outputStream110 = writeStream!.takeRetainedValue()
        
        self.inputStream110.delegate = self
        self.outputStream110.delegate = self
        
        self.inputStream110.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        self.outputStream110.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        
        self.inputStream110.open()
        self.outputStream110.open()
    }
    
    
    
    func stream(aStream: NSStream, handleEvent eventCode: NSStreamEvent) {
        
        switch eventCode{
        case NSStreamEvent.OpenCompleted:
            print("Stream opened")
            break
        case NSStreamEvent.HasSpaceAvailable:
            if outputStream101 == aStream{
                print("outputstream101 is ready!")
                isFlag1 = true
                button1.enabled = true
            }
            if outputStream102 == aStream{
                print("outputstream102 is ready!")
                isFlag2 = true
                button2.enabled = true
            }
            if outputStream103 == aStream{
                print("outputstream103 is ready!")
                isFlag3 = true
                button3.enabled = true
            }
            if outputStream104 == aStream{
                print("outputstream104 is ready!")
                isFlag4 = true
                button4.enabled = true
            }
            if outputStream105 == aStream{
                print("outputstream105 is ready!")
                isFlag5 = true
                button5.enabled = true
            }
            if outputStream106 == aStream{
                print("outputstream106 is ready!")
                isFlag6 = true
                button6.enabled = true
            }
            if outputStream107 == aStream{
                print("outputstream107 is ready!")
                isFlag7 = true
                button7.enabled = true
            }
            if outputStream108 == aStream{
                print("outputstream108 is ready!")
                isFlag8 = true
                button8.enabled = true
            }
            if outputStream109 == aStream{
                print("outputstream109 is ready!")
                isFlag9 = true
                button9.enabled = true
            }
            if outputStream110 == aStream{
                print("outputstream110 is ready!")
                isFlag10 = true
                button10.enabled = true
            }
            break
            
        case NSStreamEvent.HasBytesAvailable:
            print("has bytes")
            if aStream == inputStream101{
                var buffer: UInt8 = 0
                var len: Int!
                
                while (inputStream101?.hasBytesAvailable != nil){
                    len = inputStream101?.read(&buffer, maxLength: 1024)
                    if len > 0{
                        var output = NSString(bytes: &buffer, length: len, encoding: NSASCIIStringEncoding)
                        
                        if nil != output{
                            print("Server said: \(output)")
                            output = output?.substringFromIndex(11)
                        }
                    }
                }
            }
            if aStream == inputStream102{
                var buffer: UInt8 = 0
                var len: Int!
                
                while (inputStream102?.hasBytesAvailable != nil){
                    len = inputStream102?.read(&buffer, maxLength: 1024)
                    if len > 0{
                        var output = NSString(bytes: &buffer, length: len, encoding: NSASCIIStringEncoding)
                        
                        if nil != output{
                            print("Server said: \(output)")
                            output = output?.substringFromIndex(11)
                        }
                    }
                }
            }
            if aStream == inputStream103{
                var buffer: UInt8 = 0
                var len: Int!
                
                while (inputStream103?.hasBytesAvailable != nil){
                    len = inputStream103?.read(&buffer, maxLength: 1024)
                    if len > 0{
                        var output = NSString(bytes: &buffer, length: len, encoding: NSASCIIStringEncoding)
                        
                        if nil != output{
                            print("Server said: \(output)")
                            output = output?.substringFromIndex(11)
                        }
                    }
                }
            }
            if aStream == inputStream104{
                var buffer: UInt8 = 0
                var len: Int!
                
                while (inputStream104?.hasBytesAvailable != nil){
                    len = inputStream104?.read(&buffer, maxLength: 1024)
                    if len > 0{
                        var output = NSString(bytes: &buffer, length: len, encoding: NSASCIIStringEncoding)
                        
                        if nil != output{
                            print("Server said: \(output)")
                            output = output?.substringFromIndex(11)
                        }
                    }
                }
            }
            if aStream == inputStream105{
                var buffer: UInt8 = 0
                var len: Int!
                
                while (inputStream105?.hasBytesAvailable != nil){
                    len = inputStream105?.read(&buffer, maxLength: 1024)
                    if len > 0{
                        var output = NSString(bytes: &buffer, length: len, encoding: NSASCIIStringEncoding)
                        
                        if nil != output{
                            print("Server said: \(output)")
                            output = output?.substringFromIndex(11)
                        }
                    }
                }
            }
            if aStream == inputStream106{
                var buffer: UInt8 = 0
                var len: Int!
                
                while (inputStream106?.hasBytesAvailable != nil){
                    len = inputStream106?.read(&buffer, maxLength: 1024)
                    if len > 0{
                        var output = NSString(bytes: &buffer, length: len, encoding: NSASCIIStringEncoding)
                        
                        if nil != output{
                            print("Server said: \(output)")
                            output = output?.substringFromIndex(11)
                        }
                    }
                }
            }
            if aStream == inputStream107{
                var buffer: UInt8 = 0
                var len: Int!
                
                while (inputStream107?.hasBytesAvailable != nil){
                    len = inputStream107?.read(&buffer, maxLength: 1024)
                    if len > 0{
                        var output = NSString(bytes: &buffer, length: len, encoding: NSASCIIStringEncoding)
                        
                        if nil != output{
                            print("Server said: \(output)")
                            output = output?.substringFromIndex(11)
                        }
                    }
                }
            }
            if aStream == inputStream108{
                var buffer: UInt8 = 0
                var len: Int!
                
                while (inputStream108?.hasBytesAvailable != nil){
                    len = inputStream108?.read(&buffer, maxLength: 1024)
                    if len > 0{
                        var output = NSString(bytes: &buffer, length: len, encoding: NSASCIIStringEncoding)
                        
                        if nil != output{
                            print("Server said: \(output)")
                            output = output?.substringFromIndex(11)
                        }
                    }
                }
            }
            if aStream == inputStream109{
                var buffer: UInt8 = 0
                var len: Int!
                
                while (inputStream109?.hasBytesAvailable != nil){
                    len = inputStream109?.read(&buffer, maxLength: 1024)
                    if len > 0{
                        var output = NSString(bytes: &buffer, length: len, encoding: NSASCIIStringEncoding)
                        
                        if nil != output{
                            print("Server said: \(output)")
                            output = output?.substringFromIndex(11)
                        }
                    }
                }
            }
            if aStream == inputStream110{
                var buffer: UInt8 = 0
                var len: Int!
                
                while (inputStream110?.hasBytesAvailable != nil){
                    len = inputStream110?.read(&buffer, maxLength: 1024)
                    if len > 0{
                        var output = NSString(bytes: &buffer, length: len, encoding: NSASCIIStringEncoding)
                        
                        if nil != output{
                            print("Server said: \(output)")
                            output = output?.substringFromIndex(11)
                        }
                    }
                }
            }
            break
        case NSStreamEvent.ErrorOccurred:
            print("Can not connect to the host!")
            break
        case NSStreamEvent.EndEncountered:
            if outputStream101 == aStream{
                outputStream101.close()
                outputStream101.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
                outputStream101 = nil
            }
            if outputStream102 == aStream{
                outputStream102.close()
                outputStream102.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
                outputStream102 = nil
            }
            if outputStream103 == aStream{
                outputStream103.close()
                outputStream103.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
                outputStream103 = nil
            }
            if outputStream104 == aStream{
                outputStream104.close()
                outputStream104.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
                outputStream104 = nil
            }
            if outputStream105 == aStream{
                outputStream105.close()
                outputStream105.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
                outputStream105 = nil
            }
            if outputStream106 == aStream{
                outputStream106.close()
                outputStream106.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
                outputStream106 = nil
            }
            if outputStream107 == aStream{
                outputStream107.close()
                outputStream107.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
                outputStream107 = nil
            }
            if outputStream108 == aStream{
                outputStream108.close()
                outputStream108.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
                outputStream108 = nil
            }
            if outputStream109 == aStream{
                outputStream109.close()
                outputStream109.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
                outputStream109 = nil
            }
            if outputStream110 == aStream{
                outputStream110.close()
                outputStream110.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
                outputStream110 = nil
            }

            break
        default:
            print("Unknown event")
        }
    }
    
    
    func action(message:String){
        let data:NSData = message.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        if isFlag1{
            _ = self.outputStream101!.write(UnsafePointer(data.bytes), maxLength: data.length)
        }
        if isFlag2{
            _ = self.outputStream102!.write(UnsafePointer(data.bytes), maxLength: data.length)
        }
        if isFlag3{
            _ = self.outputStream103!.write(UnsafePointer(data.bytes), maxLength: data.length)
        }
        if isFlag4{
            _ = self.outputStream104!.write(UnsafePointer(data.bytes), maxLength: data.length)
        }
        if isFlag5{
            _ = self.outputStream105!.write(UnsafePointer(data.bytes), maxLength: data.length)
        }
        if isFlag6{
            _ = self.outputStream106!.write(UnsafePointer(data.bytes), maxLength: data.length)
        }
        if isFlag7{
            _ = self.outputStream107!.write(UnsafePointer(data.bytes), maxLength: data.length)
        }
        if isFlag8{
            _ = self.outputStream108!.write(UnsafePointer(data.bytes), maxLength: data.length)
        }
        if isFlag9{
            _ = self.outputStream109!.write(UnsafePointer(data.bytes), maxLength: data.length)
        }
        if isFlag10{
            _ = self.outputStream110!.write(UnsafePointer(data.bytes), maxLength: data.length)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}