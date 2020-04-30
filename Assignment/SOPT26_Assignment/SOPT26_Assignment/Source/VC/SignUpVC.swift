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
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var nameBackground: UIView!
    @IBOutlet var emailBackground: UIView!
    @IBOutlet var passwordBackground: UIView!
    
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
    }
    func setLabel(){
        self.signUpLabel.textColor = UIColor.royal
    }
    func setTextFieldLayout(){
        self.nameBackground.layer.cornerRadius = 22.0
        self.nameBackground.layer.masksToBounds = true
        self.nameBackground.backgroundColor = UIColor.veryLightPink
        
        self.emailBackground.layer.cornerRadius = 22.0
        self.emailBackground.layer.masksToBounds = true
        self.emailBackground.backgroundColor = UIColor.veryLightPink
        
        self.passwordBackground.layer.cornerRadius = 22.0
        self.passwordBackground.layer.masksToBounds = true
        self.passwordBackground.backgroundColor = UIColor.veryLightPink
    }
    
    
}
