//
//  GroupDetailsViewController.swift
//  RunningBud
//
//  Created by chesterzhou on 10/4/24.
//

import UIKit

class GroupDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var groupID: Int? // 用来接收传递的groupID
    var matchingUsers: [user] = [] // 用于存储匹配的用户
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // 设置tableView的delegate和dataSource
            tableView.delegate = self
            tableView.dataSource = self
            
            // 筛选与groupID匹配的用户
            filterUsersByGroupID()
        }
        
        // 根据传入的groupID筛选用户
        func filterUsersByGroupID() {
            guard let groupID = groupID else { return }
            
            // 遍历所有用户，筛选出uGroups包含该groupID的用户
            for user in users().uUsers {
                if user.uGroups.contains(groupID) {  // 如果uGroups中包含groupID
                    matchingUsers.append(user)
                }
            }
            
            // 刷新表格以显示筛选的用户
            tableView.reloadData()
        }
        
        // MARK: - UITableViewDataSource
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return matchingUsers.count
        }
        
        // 配置每一行的 cell
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "groupMemberTableViewCell", for: indexPath) as! groupMemberTableViewCell
            
            // 获取当前用户
            let user = matchingUsers[indexPath.row]
            
            // 设置自定义 cell 的显示内容
            cell.uName.text = user.uName
            cell.uTotalMiles.text = String(format: "Total Miles: %.2f", user.uWeekMiles)
            
            // 显示用户的等级
            switch user.uLevel {
            case 1:
                cell.uLevel.text = "Beginner"
            case 2:
                cell.uLevel.text = "Intermediate"
            case 3:
                cell.uLevel.text = "Advanced"
            case 4:
                cell.uLevel.text = "Elite"
            default:
                cell.uLevel.text = "Unknown"
            }
            
            // 设置用户的头像
            if let headImage = UIImage(named: user.headImage) {
                cell.head.image = headImage
            }
            
            // 隐藏 uID 的显示，并将用户 ID 赋给 userID 属性
            cell.uID.isHidden = true
            cell.userID = user.uID
            cell.uLevel.isHidden = true
            
            return cell
        }
        
        // MARK: - Segue 跳转准备
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showChatViewController" {
                // 获取目标 ViewController
                if let chatVC = segue.destination as? ChatViewController {
                    // 获取被点击的 cell 的用户
                    if let indexPath = tableView.indexPathForSelectedRow {
                        let selectedUser = matchingUsers[indexPath.row]
                        chatVC.userName = selectedUser.uName // 传递 uName 到 ChatViewController
                        chatVC.userID = selectedUser.uID    // 传递 uID 到 ChatViewController
                    }
                }
            }
        }
    }
