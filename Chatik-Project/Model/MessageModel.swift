//
//  Model.swift
//  Chatik-Project
//
//  Created by Александр Сахнюков on 26/07/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import Foundation
var messageBase = Array<Message>()
struct Message {
        var text: String
        var username: String
        var addedAt: String
        
        
        init (text: String, username: String, addedAt: String) {
            
            self.text = text
            self.username = username
            self.addedAt = addedAt
        }
    }
}
