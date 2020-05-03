//
//  HomeVC.swift
//  SOPT26_Assignment
//
//  Created by 이주혁 on 2020/05/01.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet var topViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var scrollView: UIScrollView!
 
    var topViewInitialHeightConstraintConstant: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        self.topViewInitialHeightConstraintConstant = self.topViewHeightConstraint.constant
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK:- ScrollView Delegate
extension HomeVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let stretchedHeight = -scrollView.contentOffset.y
        
        if stretchedHeight + self.topViewInitialHeightConstraintConstant > 88 {
                self.topViewHeightConstraint.constant = self.topViewInitialHeightConstraintConstant + stretchedHeight
            
        }
        else {
            self.topViewHeightConstraint.constant = 88
        }
        print(stretchedHeight)
        
    }
}
