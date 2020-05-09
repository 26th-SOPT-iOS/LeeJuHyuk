//
//  Music.swift
//  SOPT26_3rd_Seminar
//
//  Created by 이주혁 on 2020/05/09.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation
import UIKit

// Music 모델입니다.
// 멤버 변수가 총 세 개인 Music 구조체를 생성했습니다.
struct Music {
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String
    
    init(title: String, singer: String, coverName: String) {
        self.albumImg = UIImage(named: title)
        self.musicTitle = coverName
        self.singer = singer
    }
    
}
