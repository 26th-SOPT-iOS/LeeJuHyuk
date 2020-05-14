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
    
    var idStr: String?
    var pwStr: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        recognizeGestureSignUpLabel()
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
        
    // MARK:- IBAction Method
    @IBAction func touchUpLoginButton(_ sender: UIButton){
        if let dvc = self.storyboard?.instantiateViewController(identifier: "TabBarC") as? TabBarC {
            self.present(dvc, animated: true)
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
