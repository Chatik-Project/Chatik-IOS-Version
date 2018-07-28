//
//  ChatViewController.swift
//  Chatik-Project
//
//  Created by Александр Сахнюков on 26/07/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import SocketIO
import SwiftyJSON

class ChatViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    var messageBase = Array<Message>()
    var manager:SocketManager!
    var socket: SocketIOClient!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return  messageBase.count
    }
    
    @IBOutlet weak var onlineLable: UILabel!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatMessageCellTableViewCell
      
        let cellItem = messageBase[indexPath.row]
        cell.MessageText.text = cellItem.content
        cell.DateLable.text = cellItem.date
        cell.userNmae.text = cellItem.username
        
        return cell
    }

 
    @IBOutlet weak var ChatTableview: UITableView!
   
    @IBAction func SendMessageButton(_ sender: UIButton) {
        if MessageText.text == "" {
            return
        } else {
            socket.emit("msg", MessageText.text!)
            socket.emit("changeName", MessageText.text!)
        }
       MessageText.text = nil
        self.ChatTableview.reloadData()
     //   self.scrollToBottom()
        return
    }
    
    
    @IBOutlet weak var MessageText: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    override func viewDidLoad() {
       super.viewDidLoad()
        manager = SocketManager(socketURL: URL(string: "http://188.166.104.136:7777/")!, config: [.log(true), .compress])
        socket = manager.defaultSocket
       
        socket.connect()
       
      
        socket.on("connected") { data, ack in
        let json = JSON(data)
        let status = json[0].string
        self.onlineLable.text = status
        self.reloadInputViews()
            
            self.socket.on("message") { data, ack in
            let json = JSON(data)
            let data = json[0]
            let content = data["content"].string
            let date = data["date"].string
            let username = data["username"].string
            let message = Message(content: content!, username: username!, date: date!)
            self.messageBase.append(message)
            //        self.scrollToBottom()
            self.ChatTableview.reloadData()
            }
        }
       
         self.ChatTableview.reloadData()
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
        
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func scrollToBottom() {
        let indexPath = NSIndexPath(row: messageBase.count - 1, section: 0)
        self.ChatTableview.scrollToRow(at: indexPath as IndexPath, at: .bottom, animated: true)
}
    
}

