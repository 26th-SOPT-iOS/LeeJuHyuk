//
//  JoinVC.swift
//  SOPT26_Assignment
//
//  Created by 이주혁 on 2020/04/18.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class JoinVC: UIViewController {
    
    @IBOutlet weak var joinedIDTextField: UITextField!
    @IBOutlet weak var joinedPWTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func touchUpNextButton(_ sender: UIButton){
        
        let dvc = self.storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
        dvc.idStr = joinedIDTextField.text
        dvc.pwStr = joinedPWTextField.text
        
        self.present(dvc, animated: true, completion: {
            self.navigationController?.popToRootViewController(animated: true)
        })
    }
    
}
