//
//  ChatViewController.swift
//  Chatik-Project
//
//  Created by Александр Сахнюков on 26/07/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import SocketIO

class ChatViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    var messageBase = Array<Message>()
    var manager:SocketManager!
    var socketIOClient: SocketIOClient!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return  messageBase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatMessageCellTableViewCell
      
        let cellItem = messageBase[indexPath.row]
        cell.MessageText.text = cellItem.text
        cell.DateLable.text = cellItem.addedAt
        cell.userNmae.text = cellItem.username
        return cell
    }

 
    @IBOutlet weak var ChatTableview: UITableView!
   
    @IBAction func SendMessageButton(_ sender: UIButton) {
   
        return
    }
    
    
    @IBOutlet weak var MessageText: UITextField!
   
    override func viewDidLoad() {
       super.viewDidLoad()
     ConnectToSocket()
        
        
        
      

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        
      
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func ConnectToSocket() {
        
        manager = SocketManager(socketURL: URL(string: "http://138.68.234.86:7777/")!, config: [.log(true), .compress])
        socketIOClient = manager.defaultSocket
        
        socketIOClient.on(clientEvent: .connect) {data, ack in
            print(data)
            print("socket connected")
        }
        
        socketIOClient.on(clientEvent: .error) { (data, eck) in
            print(data)
            print("socket error")
        }
        
        socketIOClient.on(clientEvent: .disconnect) { (data, eck) in
            print(data)
            print("socket disconnect")
        }
        
        socketIOClient.on(clientEvent: SocketClientEvent.reconnect) { (data, eck) in
            print(data)
            print("socket reconnect")
        }
        
        socketIOClient.connect()
    }

}
