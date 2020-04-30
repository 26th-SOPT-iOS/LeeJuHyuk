//
//  ViewController.swift
//  SOPT26_2nd_Seminar
//
//  Created by 이주혁 on 2020/04/25.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var topView: UIView!
    
    @IBOutlet var topViewHeightConstraint: NSLayoutConstraint!
    var topViewHeightIdentityConstant: CGFloat!
    var initialScrollViewContentOffsetY: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        
        self.initialScrollViewContentOffsetY = self.scrollView.contentOffset.y
        self.topViewHeightIdentityConstant = self.topViewHeightConstraint.constant
        
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let stretchedHeight = -scrollView.contentOffset.y
        print(scrollView.contentOffset.y)
        
        if stretchedHeight <= 100 && stretchedHeight >= -120 {
            self.topViewHeightConstraint.constant = self.topViewHeightIdentityConstant + stretchedHeight
        }
        
        
        

    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

    }

}


