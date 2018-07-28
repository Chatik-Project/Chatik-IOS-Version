//
//  ProfilefViewController.swift
//  Chatik-Project
//
//  Created by Александр Сахнюков on 27/07/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import SocketIO



class ProfilefViewController: UIViewController {
   var socket: SocketIOClient!
   var manager:SocketManager!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeNameButton(_ sender: Any) {
            let alertController = UIAlertController(title: "Change Name", message: nil, preferredStyle: .alert)
            var alertTextField: UITextField!
            alertController.addTextField { textField in
                alertTextField = textField
                textField.placeholder = "New Name"
                
            }
            alertController.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
                let name:String = alertTextField.text!
                    SocketIOManager.sharedInstance.chageNameTest(name: name)
              print(name)
            
              
            })
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertController.addAction(cancel)
            alertController.view.backgroundColor = #colorLiteral(red: 0.2779059041, green: 0.5906637205, blue: 0.5244839149, alpha: 1)
            present(alertController, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
    }
}
