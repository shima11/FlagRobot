//
//  Socketconnection.swift
//  Socket-twisted
//
//  Created by shima jinsei on 2015/10/31.
//  Copyright © 2015年 Jinsei Shima. All rights reserved.
//

import Foundation

class SocketConnection: NSObject, NSStreamDelegate {
    
    let host :String
    let port :UInt32
    let useSSL :Bool
    
    let bufferSize = 4096
    let encoding : UInt = NSUTF8StringEncoding
    
    var inputStream : NSInputStream?
    var outputStream : NSOutputStream?
    
    init(host: String, port:UInt32, useSSL:Bool){
        self.host = host
        self.port = port
        self.useSSL = useSSL

        super.init()
    }

    
    func stream(aStream: NSStream, handleEvent aStreamEvent: NSStreamEvent) {
        print("event:\(aStreamEvent)")
        switch aStreamEvent {
        case NSStreamEvent.OpenCompleted:
            print("NSStreamEvent.OpenCompleted \(aStream.description)")
        case NSStreamEvent.HasBytesAvailable:
            print("NSStreamEvent.HasBytesAvailable \(aStream.description)")
        case NSStreamEvent.HasSpaceAvailable:
            print("NSStreamEvent.HasSpaceAvailable \(aStream.description)")
        case NSStreamEvent.EndEncountered:
            print("NSStreamEvent.EndEncountered \(aStream.description)")
            //add
            aStream.close()
            aStream.removeFromRunLoop((NSRunLoop).currentRunLoop(), forMode: NSDefaultRunLoopMode)
            
        case NSStreamEvent.None:
            print("NSStreamEvent.None \(aStream.description)")
        case NSStreamEvent.ErrorOccurred:
            print("NSStreamEvent.ErrorOccurred \(aStream.description)")
        default:
            print("# something weird happend")
        }
    }
    
    func connect() {
        print("# connecting to \(host):\(port)")
        var cfReadStream : Unmanaged<CFReadStream>?
        var cfWriteStream : Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, host, port, &cfReadStream, &cfWriteStream)
        inputStream = cfReadStream!.takeUnretainedValue()
        outputStream = cfWriteStream!.takeUnretainedValue()
        
        if self.useSSL {
            inputStream!.setProperty(kCFStreamSocketSecurityLevelNegotiatedSSL, forKey: kCFStreamPropertySocketSecurityLevel as String)
            outputStream!.setProperty(kCFStreamSocketSecurityLevelNegotiatedSSL, forKey: kCFStreamPropertySocketSecurityLevel as String)
        }
        
        inputStream!.delegate = self
        outputStream!.delegate = self
        
        inputStream!.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        outputStream!.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        
        inputStream!.open()
        outputStream!.open()

    }
    
    func read(){
        var buffer = [UInt8](count: bufferSize, repeatedValue: 0)
        var output: String = ""
        while (self.inputStream!.hasBytesAvailable){
            let bytesRead: Int = inputStream!.read(&buffer, maxLength: buffer.count)
            if bytesRead >= 0 {
                output += NSString(bytes: UnsafePointer(buffer), length: bytesRead, encoding: encoding)! as String
            } else {
                print("# error")
            }
            print("< \(output)")
        }
    }
    
    func send(message:String){
        if (self.outputStream!.hasSpaceAvailable){
            let data:NSData = message.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
            _ = self.outputStream!.write(UnsafePointer(data.bytes), maxLength: data.length)
            print("> \(message)")
        } else {
            print("# steam busy")
        }
    }
    
}