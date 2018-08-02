//
//  ProfilefViewController.swift
//  Chatik-Project
//
//  Created by Александр Сахнюков on 27/07/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import SocketIO
import Alamofire
import SwiftyJSON


class ProfilefViewController: UIViewController {
   var socket: SocketIOClient!
   var manager:SocketManager!
    var name2:String = ""
    var token:String = ""
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passworfTextField: UITextField!
    
    // CHANGES NAME
    
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
              
                self.name2 = name
               })
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertController.addAction(cancel)
            alertController.view.backgroundColor = #colorLiteral(red: 0.2779059041, green: 0.5906637205, blue: 0.5244839149, alpha: 1)
            present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func LogInButton(_ sender: Any) {
        if loginTextField.text != "" && passworfTextField.text != "" {
            let login: [String: String] = ["username" : loginTextField.text!, "password" : passworfTextField.text!]
       
            request("http://138.68.234.86/login", method: .post, parameters: login).validate().responseJSON
            { responseJSON in
           
              if responseJSON != nil {
                
                self.performSegue(withIdentifier: "LogInSegue", sender: nil)}
              else {return}
            print("Жопа \(responseJSON)")
            }
        } else {return}
    }

    @IBAction func RegistButton(_ sender: Any) {

    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if token == "" {
            return
        } else {
            self.performSegue(withIdentifier: "LogInSegue", sender: nil)}
        }
}


