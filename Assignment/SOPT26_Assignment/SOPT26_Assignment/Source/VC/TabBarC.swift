//
//  TabBarC.swift
//  SOPT26_Assignment
//
//  Created by 이주혁 on 2020/05/14.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class TabBarC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        self.tabBar.tintColor = UIColor.black
    }
    
    func setTabBar(){
        // First Tap init
        let FriendsStoryboard = UIStoryboard.init(name: "Friends", bundle: nil)
        guard let firstTab = FriendsStoryboard.instantiateViewController(identifier: "FriendsVC")
            as? FriendsVC  else {
            return
        }

        firstTab.tabBarItem.title = "친구"
        firstTab.tabBarItem.image = UIImage.init(systemName: "person")
        firstTab.tabBarItem.selectedImage = UIImage.init(systemName: "person.fill")
        
        
        // Second Tap init
        let HomeStoryboard = UIStoryboard.init(name: "Home", bundle: nil)
        guard let secondTab = HomeStoryboard.instantiateViewController(identifier: "HomeVC")
            as? HomeVC  else {
            return
        }
        secondTab.tabBarItem.title = "홈"
        secondTab.tabBarItem.image = UIImage(named: "homeUnselectedIc")
        secondTab.tabBarItem.selectedImage = UIImage(named: "homeSelectedIc")
        
        
        // Create an Array of Tables with Tabs as Elements.
        let tabs =  [firstTab, secondTab]
        // Set the ViewController.
        self.setViewControllers(tabs, animated: false)
        // Do any additional setup after loading the view.
        
    }

}
