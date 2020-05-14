//
//  FriendProfileCell.swift
//  SOPT26_Assignment
//
//  Created by 이주혁 on 2020/05/14.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class FriendProfileCell: UITableViewCell {

    static let identifier = "FriendProfileCell"
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var stateMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        stateMessageLabel.textColor = UIColor.brownishGreyTwo
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLayout(friend: Friend){
        //assetName: String, name: String, stateMessage: String
        let assetName = friend.profileImageName
        let name = friend.name
        let stateMessage = friend.stateMessage
        
        if let image = UIImage(named: assetName) {
            profileImage.image = image
        }
        else {
            profileImage.image = UIImage.init(systemName: "person.fill")
        }
        nameLabel.text = name
        stateMessageLabel.text = stateMessage
    }

}
