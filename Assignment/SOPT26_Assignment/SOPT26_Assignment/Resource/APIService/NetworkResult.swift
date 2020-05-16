//
//  NetworkResult.swift
//  SOPT26_Assignment
//
//  Created by 이주혁 on 2020/05/16.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
    //case dbErr
}
