//
//  ViewController.swift
//  SOPT26_Assignment
//
//  Created by 이주혁 on 2020/04/18.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func touchUpLoginButton(_ sender: UIButton){
        let dvc = self.storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
        dvc.idStr = idTextField.text
        dvc.pwStr = pwTextField.text
        
        self.present(dvc, animated: true, completion: {
            self.pwTextField.text = ""
        })
        
    }
    
    @IBAction func touchupJoinButton(_ sender: UIButton){
        let dvc = self.storyboard?.instantiateViewController(identifier: "JoinVC") as! JoinVC
        
        self.navigationController?.pushViewController(dvc, animated: true)
    }

}

