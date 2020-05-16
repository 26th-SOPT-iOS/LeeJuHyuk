//
//  JoinVC.swift
//  SOPT26_Assignment
//
//  Created by 이주혁 on 2020/04/18.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet var signUpLabel: UILabel!
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    
    @IBOutlet var idBackground: UIView!
    @IBOutlet var nameBackground: UIView!
    @IBOutlet var emailBackground: UIView!
    @IBOutlet var passwordBackground: UIView!
    @IBOutlet var phoneNumberBackground: UIView!
    
    @IBOutlet var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLayout()
    }
    
    //MARK:- Custom Method
    func setLayout(){
        setTextFieldLayout()
        setLabel()
        setButton()
    }
    func setLabel(){
        self.signUpLabel.textColor = UIColor.royal
    }
    func setTextFieldLayout(){
        
        self.idBackground.layer.cornerRadius = 22.0
        self.idBackground.layer.masksToBounds = true
        self.idBackground.backgroundColor = UIColor.veryLightPink
        
        self.nameBackground.layer.cornerRadius = 22.0
        self.nameBackground.layer.masksToBounds = true
        self.nameBackground.backgroundColor = UIColor.veryLightPink
        
        self.emailBackground.layer.cornerRadius = 22.0
        self.emailBackground.layer.masksToBounds = true
        self.emailBackground.backgroundColor = UIColor.veryLightPink
        
        self.passwordBackground.layer.cornerRadius = 22.0
        self.passwordBackground.layer.masksToBounds = true
        self.passwordBackground.backgroundColor = UIColor.veryLightPink
        
        self.phoneNumberBackground.layer.cornerRadius = 22.0
        self.phoneNumberBackground.layer.masksToBounds = true
        self.phoneNumberBackground.backgroundColor = UIColor.veryLightPink
    }
    
    func setButton(){
        self.signUpButton.layer.cornerRadius = 24.0
        self.signUpButton.layer.masksToBounds = true
        self.signUpButton.backgroundColor = UIColor.royal
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButton(_ sender: UIButton){
        
        guard let id = idTextField.text else { return }
        guard let pw = passwordTextField.text else { return }
        guard let name = nameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let phoneNumber = phoneNumberTextField.text else { return }
        
        AuthService.shared.signUp(id: id,
                                  pw: pw,
                                  name: name,
                                  email: email,
                                  phone: phoneNumber) { result in
                                    
                                    switch result {
                                    case .success(_):
                                        self.navigationController?.popViewController(animated: true)
                                    case .requestErr(let msg):
                                        let alert = UIAlertController(title: "회원가입 실패",
                                                                      message: msg as? String ?? "",
                                                                      preferredStyle: .alert)
                                        let action = UIAlertAction(title: "확인",
                                                                   style: .default)
                                        
                                        alert.addAction(action)
                                        self.present(alert, animated: true)
                                    case .pathErr:
                                        print("path err")
                                    case .serverErr:
                                        print("server err")
                                    case .networkFail:
                                        print("network err")
                                    }
        }
        
        

    }
    
    
}
