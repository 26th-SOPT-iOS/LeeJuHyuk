//
//  DetailViewController.swift
//  SOPT26_3rd_Seminar
//
//  Created by 이주혁 on 2020/05/09.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var weatherImageView: UIImageView!
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    
    var imageName: String = ""
    var date: String = ""
    var subTitle: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }
    
    func initView(){
        
        weatherImageView.image = UIImage(named: imageName)
        dateLabel.text = date
        subTitleLabel.text = subTitle
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
