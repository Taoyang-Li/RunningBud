//
//  myGroupViewController.swift
//  RunningBud
//
//  Created by chesterzhou on 11/6/24.
//

import UIKit

class myGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CreateChallengeDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var myGroupsData = myGroups() // 获取 DataStore 中的 groups 数据
        var usersData = users() // 获取用户数据

        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.delegate = self
            tableView.dataSource = self
            
            NotificationCenter.default.addObserver(self, selector: #selector(updateLastMessage(_:)), name: Notification.Name("UpdateLastMessage"), object: nil)
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // 仅刷新 tableView，而不重新加载 myGroupsData.groups
            tableView.reloadData()
        }

        deinit {
            NotificationCenter.default.removeObserver(self)
        }
        
        // 更新最后一条消息
        @objc func updateLastMessage(_ notification: Notification) {
            if let userInfo = notification.userInfo,
               let lastMessage = userInfo["lastMessage"] as? String,
               let groupID = userInfo["groupID"] as? Int,
               let index = myGroupsData.groups.firstIndex(where: { $0.myGroupID == groupID }) {
                
                // 更新该组的最后一条消息
                myGroupsData.groups[index].chatMess.append(lastMessage)
                
                // 刷新指定的行
                let indexPath = IndexPath(row: index, section: 0)
                tableView.reloadRows(at: [indexPath], with: .none)
            }
        }

        // 设置 TableView 行数
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myGroupsData.groups.count
        }
        
        // 配置单元格
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupTableViewCell", for: indexPath) as? myGroupTableViewCell else {
                return UITableViewCell()
            }
            
            let group = myGroupsData.groups[indexPath.row]
            
            // 设置 groupname
            cell.groupname.text = group.myGroupName
            
            // 设置 lastsentence 为 chatMess 中的最后一句话
            if let lastMessage = group.chatMess.last, !lastMessage.isEmpty {
                cell.lastsentence.attributedText = formatMessageWithBoldUsername(lastMessage)
            } else {
                cell.lastsentence.text = "No messages yet"
            }
            
            // 设置头像
            let memberIDs = group.memberID
            var headImages: [UIImage] = []
            
            for memberID in memberIDs {
                if let user = usersData.uUsers.first(where: { $0.uID == memberID }),
                   let headImage = UIImage(named: user.headImage) {
                    headImages.append(headImage)
                }
            }
            
            // 根据成员数量设置头像
            switch headImages.count {
            case 1:
                cell.image1.image = headImages[0]
                cell.image2.image = UIImage(systemName: "person")
                cell.image3.image = UIImage(systemName: "person")
                cell.image4.image = UIImage(systemName: "person")
            case 2:
                cell.image1.image = headImages[0]
                cell.image2.image = headImages[1]
                cell.image3.image = UIImage(systemName: "person")
                cell.image4.image = UIImage(systemName: "person")
            case 3:
                cell.image1.image = headImages[0]
                cell.image2.image = headImages[1]
                cell.image3.image = headImages[2]
                cell.image4.image = UIImage(systemName: "person")
            case 4:
                cell.image1.image = headImages[0]
                cell.image2.image = headImages[1]
                cell.image3.image = headImages[2]
                cell.image4.image = headImages[3]
            default:
                // 随机选取4个头像
                let randomImages = headImages.shuffled().prefix(4)
                cell.image1.image = randomImages.indices.contains(0) ? randomImages[0] : UIImage(systemName: "person")
                cell.image2.image = randomImages.indices.contains(1) ? randomImages[1] : UIImage(systemName: "person")
                cell.image3.image = randomImages.indices.contains(2) ? randomImages[2] : UIImage(systemName: "person")
                cell.image4.image = randomImages.indices.contains(3) ? randomImages[3] : UIImage(systemName: "person")
            }
            
            return cell
        }
        
        // 准备传递数据给下一个视图控制器
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toCreateChallengeVC",
               let createChallengeVC = segue.destination as? createChallengeVC {
                createChallengeVC.delegate = self // 设置委托
            } else if segue.identifier == "toMyGroupChatPage",
                      let chatVC = segue.destination as? myGroupChatViewController,
                      let indexPath = tableView.indexPathForSelectedRow {
                let group = myGroupsData.groups[indexPath.row]
                chatVC.groupID = group.myGroupID
            }
        }

        // CreateChallengeDelegate 方法
        func didCreateGroup(_ group: myGroup) {
            // 将新创建的群组添加到 myGroupsData.groups 数组
            myGroupsData.groups.append(group)
            tableView.reloadData()
            
            // 打印调试信息，检查接收的 cGroup 内容
            print("Received new group in myGroupViewController:")
            print("Group ID: \(group.myGroupID), Name: \(group.myGroupName), Members: \(group.memberID)")
            
            print("Current groups in myGroupsData:")
            for group in myGroupsData.groups {
                print("Group ID: \(group.myGroupID), Name: \(group.myGroupName), Members: \(group.memberID)")
            }
        }
        
        // 将用户名设置为粗体的辅助函数
        func formatMessageWithBoldUsername(_ message: String) -> NSAttributedString {
            let pattern = "\\$(.*?)\\$" // 匹配在两个 $ 符号之间的内容
            let attributedString = NSMutableAttributedString(string: message)
            
            if let regex = try? NSRegularExpression(pattern: pattern) {
                let matches = regex.matches(in: message, range: NSRange(message.startIndex..., in: message))
                
                for match in matches {
                    if let range = Range(match.range(at: 1), in: message) {
                        let username = String(message[range])
                        let nsRange = NSRange(range, in: message)
                        
                        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: nsRange)
                        attributedString.replaceCharacters(in: match.range, with: username) // 去掉 $ 符号
                    }
                }
            }
            
            return attributedString
        }
    }
