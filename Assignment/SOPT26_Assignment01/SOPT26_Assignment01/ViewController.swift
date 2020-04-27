//
//  ViewController.swift
//  SOPT26_Assignment01
//
//  Created by 이주혁 on 2020/04/18.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let purpleScreenButton: UIButton = UIButton(type: .system)
    let pinkScreenButton: UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpButton()
        addStackView()
    }
    
    func setUpButton(){
        purpleScreenButton.setTitle("Purple Screen", for: .normal)
        purpleScreenButton.setTitleColor(.black, for: .normal)
        purpleScreenButton.addTarget(self,
                                     action: #selector(self.touchUpButton(_:)),
                                     for: .touchUpInside)

        pinkScreenButton.setTitle("Pink Screen", for: .normal)
        pinkScreenButton.setTitleColor(.black, for: .normal)
        pinkScreenButton.addTarget(self,
                                   action: #selector(self.touchUpButton(_:)),
                                   for: .touchUpInside)
    }
    
    func addStackView(){
        
        let stackView: UIStackView = UIStackView(arrangedSubviews: [purpleScreenButton, pinkScreenButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)



        let constraintX: NSLayoutConstraint = NSLayoutConstraint(item: stackView,
                                                                 attribute: .centerX,
                                                                 relatedBy: .equal,
                                                                 toItem: self.view,
                                                                 attribute: .centerX,
                                                                 multiplier: 1.0,
                                                                 constant: 0)
        let constraintY: NSLayoutConstraint = NSLayoutConstraint(item: stackView,
                                                                 attribute: .centerY,
                                                                 relatedBy: .equal,
                                                                 toItem: self.view,
                                                                 attribute: .centerY,
                                                                 multiplier: 1.0,
                                                                 constant: 0)
        constraintX.isActive = true
        constraintY.isActive = true
    }
    
    @objc func touchUpButton(_ sender: UIButton){
        var identifier: String = ""
        switch sender.titleLabel?.text {
        case "Purple Screen":
            identifier = "purpleVC"
        case "Pink Screen":
            identifier = "pinkVC"
        default:
            identifier = ""
        }
        
        guard let dvc = self.storyboard?.instantiateViewController(identifier: identifier) else {
            return
        }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    


}

