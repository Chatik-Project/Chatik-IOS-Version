//
//  SocketManager.swift
//  Chatik-Project
//
//  Created by Александр Сахнюков on 28/07/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import Foundation
import  SocketIO

class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    var socket = SocketIOClient(socketURL: URL(string: "https://your-ngrok-url.ngrok.io")!, config: [.log(false), .forcePolling(true)])
    
    override init() {
        super.init()
        
        socket.on("test") { dataArray, ack in
            print(dataArray)
        }
        
    }
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
}
