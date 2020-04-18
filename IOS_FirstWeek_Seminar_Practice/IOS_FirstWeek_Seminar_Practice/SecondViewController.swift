//
//  SecondViewController.swift
//  IOS_FirstWeek_Seminar_Practice
//
//  Created by 이주혁 on 2020/04/18.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var switchLabel: UILabel!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    var name: String?
    var email: String?
    var isOnOff: Bool?
    var frequency: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func touchUpBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setLabels(){
        
        guard let name = self.name else { return }
        guard let email = self.email else { return }
        guard let isOnOff = self.isOnOff else { return }
        guard let frequency = self.frequency else { return }
        
        self.nameLabel.text = name
        self.emailLabel.text = email
        self.switchLabel.text = isOnOff ? "On" : "Off"
        self.sliderLabel.text = "\(frequency)"
        
    }
}
