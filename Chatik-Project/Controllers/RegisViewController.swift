//
//  RegisViewController.swift
//  Chatik-Project
//
//  Created by Александр Сахнюков on 30/07/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import Alamofire

class RegisViewController: UIViewController {
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBAction func RegButton(_ sender: Any) {
        if NameTextField.text != "" && LoginTextField.text != "" && PasswordTextField.text != "" {
            let regist: [String: Any] = ["email" : LoginTextField.text!, "username" : NameTextField.text!, "password" : PasswordTextField.text!]
            
            request("http://188.166.104.136:7777/register", method: .post, parameters: regist).validate().responseJSON
                { responseJSON in
                    print("Жопа регистрация \(responseJSON)")
            }
        } else {return}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
