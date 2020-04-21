//
//  LoginVC.swift
//  SOPT26_Assignment
//
//  Created by 이주혁 on 2020/04/18.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var loginedIDTextField: UITextField!
    @IBOutlet weak var loginedPWTextField: UITextField!
    
    var idStr: String?
    var pwStr: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        fillTextField()
        // Do any additional setup after loading the view.
    }
    func fillTextField(){
        if let id = idStr {
            loginedIDTextField.text = id
        }
        if let pw = pwStr {
            loginedPWTextField.text = pw
        }
        loginedPWTextField.isEnabled = false
        loginedIDTextField.isEnabled = false

    }
    
    @IBAction func touchUpLogoutButton(_ sender: UIButton){
        self.dismiss(animated: true, completion: {
            
        })
    }

}
