//
//  AuthService.swift
//  SOPT26_Assignment
//
//  Created by 이주혁 on 2020/05/16.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation
import Alamofire


struct AuthService {
    
    static let shared = AuthService()
    // NetworkResult 파일에 통신 상태 5가지를 명시했었음 --> 이게 모델이 됨
    // @escaping에 명시한 모델을 반환하여 그에 따라 다르게 처리
    
    /**
     로그인 통신 메소드
     **/
    
    func login(_ id: String, _ pw: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "id" : id,
            "password" : pw
        ]
        
        Alamofire.request(APIConstants.signinURL,
                          method: .post,
                          parameters: body,
                          encoding: JSONEncoding.default,
                          headers: header)
            .responseData { response in
                switch response.result {
                case .success:
                    guard let statusCode = response.response?.statusCode else {
                        return
                    }
                    guard let value = response.result.value else {
                        return
                    }
                    let networkResult = self.judge(by: statusCode, value)
                    completion(networkResult)
                    
                case .failure:
                    completion(.networkFail)
                }


        }
    } // func login
    
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200:
            return isUser(by: data)
        case 400:
            return .pathErr
        case 500:
            return .serverErr
        default:
            return .networkFail
            
        }
    }
    
    private func isUser(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(SigininData.self, from: data) else {
            return .pathErr
        }

        guard let tokenData = decodedData.data else {
            return .requestErr(decodedData.message)
        }
        
        return .success(tokenData.jwt)
    }
    
    func signUp(id: String, pw: String, name: String, email: String, phone: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "id": id,
            "password": pw,
            "name": name,
            "email": email,
            "phone": phone
        ]
        
        Alamofire.request(APIConstants.signupURL,
                          method: .post,
                          parameters: body,
                          encoding: JSONEncoding.default,
                          headers: header)
            .responseData { response in
                switch response.result {
                case .success:
                    guard let statusCode = response.response?.statusCode else {
                        return
                    }
                    guard let value = response.result.value else {
                        return
                    }
                    completion(self.hasSigneUpCorrectly(status: statusCode, data: value))
                case .failure:
                    completion(.networkFail)
                }
        }
    }
    
    private func hasSigneUpCorrectly(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(ResponseData.self, from: data)
            
            switch status {
            case 200:
                print(status)
                if result.success {
                    return .success(result.message)
                }
                else {
                    return .requestErr(result.message)
                }
            case 400:
                return .pathErr
            case 500:
                return .serverErr
            default:
                return .pathErr
            }
        }
        catch{
            return .pathErr
        }
    }
}
