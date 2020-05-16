//
//  LoginVC.swift
//  SOPT26_Assignment
//
//  Created by 이주혁 on 2020/04/18.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet var inputEmailTextField: UITextField!
    @IBOutlet var inputPWTextField: UITextField!
    
    @IBOutlet var emailBackground: UIView!
    @IBOutlet var passwordBackground: UIView!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signUpLabel: UILabel!
    
    @IBOutlet var autoLoginCheckedButton: UIButton!
    
    var idStr: String?
    var pwStr: String?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        recognizeGestureSignUpLabel()
        autoLoginCheck()
    }
    
    // MARK:- Custom Method
    // MARK: Layout
    func setLayout(){
        setTextFieldLayout()
        setSignUpButtonLayout()
        setSignUpButton()
        
    }
    
    func setTextFieldLayout(){
        self.emailBackground.backgroundColor = UIColor.veryLightPink
        self.passwordBackground.backgroundColor = UIColor.veryLightPink
        
        self.emailBackground.layer.cornerRadius = 24.0
        self.passwordBackground.layer.cornerRadius = 24.0
        self.emailBackground.layer.masksToBounds = true
        self.passwordBackground.layer.masksToBounds = true
    }
    func setSignUpButtonLayout(){
        self.loginButton.backgroundColor = UIColor.royal
        
        self.loginButton.layer.cornerRadius = 24
        self.loginButton.layer.masksToBounds = true
    }
    
    func setSignUpButton(){
        self.signUpLabel.textColor = UIColor.brownishGrey
    }
    
    func recognizeGestureSignUpLabel(){
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchUpSignUpLabel))
        self.signUpLabel.isUserInteractionEnabled = true
        self.signUpLabel.addGestureRecognizer(tapGesture)
    }
    
    func autoLoginCheck(){
        //let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
        
        if UserDefaults.standard.bool(forKey: UserDefaultKeys.autoLoginCheck) {
            print("auto login checked")
            if let dvc = self.storyboard?.instantiateViewController(identifier: "TabBarC") as? TabBarC {
                self.present(dvc, animated: true, completion: nil)
            }
        }
    }
        
    // MARK:- IBAction Method
    @IBAction func touchUpLoginButton(_ sender: UIButton){
        guard let id = inputEmailTextField.text else { return }
        guard let pw = inputPWTextField.text else { return }
        
        AuthService.shared.login(id, pw) { networkResult in
            switch networkResult {
            case .success(let token):
                if self.autoLoginCheckedButton.isSelected {
                    UserDefaults.standard.set(true, forKey: UserDefaultKeys.autoLoginCheck)

                }
                UserDefaults.standard.set(token, forKey: UserDefaultKeys.token)
                if let dvc = self.storyboard?.instantiateViewController(identifier: "TabBarC") as? TabBarC {
                    self.present(dvc, animated: true)
                }
                
            case .requestErr(let msg):
                
                let alert = UIAlertController(title: "로그인 실패",
                                              message: msg as? String ?? "",
                                              preferredStyle: .alert)
                
                let action = UIAlertAction(title: "확인", style: .default)
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
            case .serverErr:
                print("server fail")
            case .pathErr:
                print("path fail")
            case .networkFail:
                print("network fail")
            }
        }
    }
    
    @IBAction func touchUpAutoLoginCheckedButton(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            sender.tintColor = UIColor.systemBlue
        }
        else {
            
            sender.tintColor = UIColor.darkGray
        }
    }
    
    // MARK:- objc Method
    @objc func touchUpSignUpLabel(){
        let storyboard = UIStoryboard.init(name: "SignUp", bundle: nil)
        if let dvc = storyboard.instantiateViewController(identifier: "SignUpVC") as? SignUpVC {
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }

}
