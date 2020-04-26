//
//  FirstViewController.swift
//  IOS_FirstWeek_Seminar_Practice
//
//  Created by 이주혁 on 2020/04/18.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var sampleSwitch: UISwitch!
    
    @IBOutlet weak var sampleSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func touchUpViewTransitionButton(_ sender: UIButton) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "SecondVC") as? SecondViewController else { return }
        
        dvc.name = self.nameTextField.text
        dvc.email = self.emailTextField.text
        dvc.isOnOff = self.sampleSwitch.isOn
        dvc.frequency = self.sampleSlider.value
        
        self.present(dvc, animated: true, completion: nil)
    }
    

}
