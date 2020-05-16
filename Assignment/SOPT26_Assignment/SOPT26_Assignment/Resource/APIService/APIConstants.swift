//
//  APIConstants.swift
//  SOPT26_Assignment
//
//  Created by 이주혁 on 2020/05/16.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation


struct APIConstants {
   // 13.209.144.115:3333/user/signin
    static let baseURL = "http://13.209.144.115:3333"
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let signupURL = APIConstants.baseURL + "/user/signup"

}
