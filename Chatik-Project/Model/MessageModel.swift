//
//  Model.swift
//  Chatik-Project
//
//  Created by Александр Сахнюков on 26/07/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import Foundation
import SocketIO

struct Message {
        var content: String
        var username: String
        var date: String
        
        
    init (content: String, username:String, date:String) {
      
            self.content = content
            self.username = username
            self.date = date
        }

}
struct CustomData : SocketData {
    var content: String
    var username: String
    var date: String
    
    func socketRepresentation() -> SocketData {
        return ["content": content, "username": username,"date": date]
    }
}
