//
//  UserModel.swift
//  Chatik-Project
//
//  Created by Александр Сахнюков on 26/07/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import Foundation


struct UserModel {
    let userId:String
    let userEmail:String

        
        
        init (userId: String, userEmail:String) {
            
            self.userId = userId
            self.userEmail = userEmail
   
        }
        
    }

