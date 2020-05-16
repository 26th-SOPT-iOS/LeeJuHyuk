//
//  FriendsVC.swift
//  SOPT26_Assignment
//
//  Created by 이주혁 on 2020/05/14.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class FriendsVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var user: User = User(name: "이주혁", profileImageName: "profile1Img")
    
    var friendsList: [Friend] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setFriendsList()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //MARK:- Custom Method
    func setFriendsList(){
        friendsList.append(Friend(name: "김남수", profileImageName: "profile7Img", stateMessage: "제가 바로 아요 체고입니다."))
        friendsList.append(Friend(name: "김현지", profileImageName: "profile6Img", stateMessage: "제가 바로 총무입니다."))
        friendsList.append(Friend(name: "이승호", profileImageName: "profile1Img", stateMessage: "오이도 체고 아요 입니다."))
        friendsList.append(Friend(name: "황인준", profileImageName: "profile4Img", stateMessage: "판교..는아니고 그쯤 어디 체고 아요 입니다."))
        friendsList.append(Friend(name: "유현지", profileImageName: "profile3Img", stateMessage: "사가정 체고 아요 입니다."))
        friendsList.append(Friend(name: "오준현", profileImageName: "profile9Img", stateMessage: "비솝트 체고 아요 입니다."))
        friendsList.append(Friend(name: "황수빈", profileImageName: "profile2Img", stateMessage: "그래요 제가바로 전 팥장 입니다."))
        friendsList.append(Friend(name: "최은지", profileImageName: "profile3Img", stateMessage: "명키와이 입니다."))
        friendsList.append(Friend(name: "윤동민", profileImageName: "profile4Img", stateMessage: "솝트 체고 아요 입니다."))
        friendsList.append(Friend(name: "이승수", profileImageName: "profile10Img", stateMessage: "저는 어디에나 있고 어디에도 없습니다."))
        friendsList.append(Friend(name: "케디", profileImageName: "profile2Img", stateMessage: "건기식의"))
        friendsList.append(Friend(name: "CareD", profileImageName: "profile2Img", stateMessage: "정보비대칭성을"))
        friendsList.append(Friend(name: "케어디렉션", profileImageName: "profile2Img", stateMessage: "해결해 드리겠습니다.."))
        friendsList.append(Friend(name: "CareDirection", profileImageName: "profile2Img", stateMessage: "Coming soon.."))

    }
    
    // MARK:- IBAction
    
    @IBAction func touchUpSettingButton(_ sendenr: UIButton){
        let actionSheet = UIAlertController(title: nil, message: "설정", preferredStyle: .actionSheet)
        
        let manageFriendAction = UIAlertAction(title: "친구 관리", style: .default)
        let totalSettingAction = UIAlertAction(title: "전체 설정", style: .default)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        
        actionSheet.addAction(manageFriendAction)
        actionSheet.addAction(totalSettingAction)
        actionSheet.addAction(cancelAction)
        
        actionSheet.view.addSubview(UIView())
        self.present(actionSheet, animated: true, completion: nil)
    }

}
// MARK:- UITableViewDataSource
extension FriendsVC: UITableViewDelegate {
    
    
}

// MARK:- UITableViewDataSource
extension FriendsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        if section == 1 {
            let friendCountLabel = UILabel()
            friendCountLabel.text = "친구 \(self.friendsList.count)"
            friendCountLabel.textColor = UIColor.brownGrey
            friendCountLabel.frame = CGRect.init(x: 15, y: 0, width: 35, height: 17)
            friendCountLabel.font = UIFont.systemFont(ofSize: 11)
            headerView.addSubview(friendCountLabel)
            
            friendCountLabel.translatesAutoresizingMaskIntoConstraints = false
            let constraintX = NSLayoutConstraint.init(item: friendCountLabel,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: headerView,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 16)
            let constraintY = NSLayoutConstraint.init(item: friendCountLabel,
                                                      attribute: .centerY,
                                                      relatedBy: .equal,
                                                      toItem: headerView,
                                                      attribute: .centerY,
                                                      multiplier: 1.0,
                                                      constant: 0)
            
            NSLayoutConstraint.activate([constraintX, constraintY])
        }
            
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return self.friendsList.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: MyProfileCell.identifier) as? MyProfileCell {
                cell.setLayout(user: self.user)

                return cell
            }
        case 1:
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: FriendProfileCell.identifier) as? FriendProfileCell {
                cell.setLayout(friend: self.friendsList[indexPath.row])
                
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        if indexPath.section == 1 {
            let deleteAction = UIContextualAction(style: .destructive, title: "안녕..") { (action, view, success ) in
                self.friendsList.remove(at: indexPath.row)
                self.tableView.reloadData()
                
            }
            let config = UISwipeActionsConfiguration(actions: [deleteAction])
            config.performsFirstActionWithFullSwipe = false
            return config
        }
        else {
            return UISwipeActionsConfiguration()
        }
    }
    
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        self.friendsList.remove(at: indexPath.row)
//    }
}
