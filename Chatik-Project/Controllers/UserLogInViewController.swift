//
//  UserLogInViewController.swift
//  Chatik-Project
//
//  Created by Александр Сахнюков on 30/07/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import Alamofire

class UserLogInViewController: UIViewController {

    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     
            

        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func LogOutButton(_ sender: Any) {
        request("http://138.68.234.86/logout", method: .post).validate().responseJSON
            { responseJSON in
                print(responseJSON)}
      
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func ChangeUSerNameButton(_ sender: Any) {
        let newName = ["newname":nameTextField.text!]
        request("http://138.68.234.86/changename", method: .post,parameters: newName).validate().responseJSON
            { responseJSON in
                print(responseJSON)}

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
