//
//  MyProfileCell.swift
//  SOPT26_Assignment
//
//  Created by 이주혁 on 2020/05/14.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class MyProfileCell: UITableViewCell {

    static let identifier = "MyProfileCell"
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var separatorView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        separatorView.backgroundColor = UIColor.brownishGreyTwo
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLayout(user: User){
        
        let assetName = user.profileImageName
        let name = user.name
        
        if let image = UIImage(named: assetName) {
            profileImage.image = image
        }
        else {
            profileImage.image = UIImage.init(systemName: "person.fill")
        }
        
        nameLabel.text = name
    }

}
