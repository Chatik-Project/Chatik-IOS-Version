//
//  ChatMessageCellTableViewCell.swift
//  Chatik-Project
//
//  Created by Александр Сахнюков on 26/07/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit

class ChatMessageCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var MessageText: UITextView!
    @IBOutlet weak var DateLable: UILabel!
    @IBOutlet weak var userNmae: UILabel!
    @IBOutlet weak var ProfilePhoto: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        ProfilePhoto.layer.cornerRadius = ProfilePhoto.frame.size.width / 2
      ProfilePhoto.clipsToBounds = true
    
      
    }

}
