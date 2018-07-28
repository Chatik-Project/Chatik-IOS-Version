//
//  SocketManager.swift
//  Chatik-Project
//
//  Created by Александр Сахнюков on 28/07/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import Foundation
import  SocketIO
import SwiftyJSON
var manager:SocketManager!

class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    
static    let manager = SocketManager(socketURL: URL(string: "http://188.166.104.136:7777/")!, config: [.log(true), .compress])

static  let socket = manager.defaultSocket

    override init() {
        super.init()
    }
    
    
    func establishConnection() {
        SocketIOManager.socket.connect()
    }
    
    
    func closeConnection() {
        SocketIOManager.socket.disconnect()
    }
    
    func sendMessageTest (messageText:String) {
        SocketIOManager.socket.emit("msg", messageText)
    }
    func chageNameTest (name :String) {
        SocketIOManager.socket.emit("changeName", name)
    }

}
