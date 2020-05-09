//
//  MusicCell.swift
//  SOPT26_3rd_Seminar
//
//  Created by 이주혁 on 2020/05/09.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class MusicCell: UICollectionViewCell {
    static let identifier: String = "MusicCell"
    
    @IBOutlet var albumImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var singerLabel: UILabel!
    
    func set(_ musicInformation: Music) {
        albumImageView.image = musicInformation.albumImg
        titleLabel.text = musicInformation.musicTitle
        singerLabel.text = musicInformation.singer
    }
}
