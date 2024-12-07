//
//  friendMessageVC.swift
//  RunningBud
//
//  Created by chesterzhou on 10/13/24.
//

import UIKit

class friendMessageVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noFriendsLabel: UILabel!  // 用于显示没有好友时的提示

    @IBOutlet weak var searchBar: UISearchBar! // 新增的搜索栏

    @IBOutlet weak var imageSliderView: ImageSlider!
    var imageNames: [String] = ["ads1", "ads2", "ads3", "ads4", "ads5", "ads6", "ads7"]
    var friends: [user] = []
        var searchResults: [user] = []
        var addedFriendIDs: [Int] = [] // 用于跟踪已添加好友的ID
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
            searchBar.delegate = self
            loadFriends()
            
        }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 根据 paiedUser 控制 scrollView 可见性和 jGroups 位置
        if paiedUser {
            imageSliderView.isHidden = true
            tableView.frame.size.height = 700
            
        } else {
            imageSliderView.configure(with: imageNames, scrollInterval: 3.0)
            
        }
    }

        func loadFriends() {
            friends.removeAll()
            for friendID in friendList.sorted() {
                if let foundUser = users().uUsers.first(where: { $0.uID == friendID }) {
                    friends.append(foundUser)
                }
            }
            searchResults = friends
            tableView.reloadData()
            noFriendsLabel.isHidden = !friends.isEmpty
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                searchResults = friends
            } else {
                let allMatchingUsers = users().uUsers.filter { $0.uName.lowercased().contains(searchText.lowercased()) }
                let friendMatches = allMatchingUsers.filter { friendList.contains($0.uID) }
                let nonFriendMatches = allMatchingUsers.filter { !friendList.contains($0.uID) }
                searchResults = friendMatches + nonFriendMatches
            }
            tableView.reloadData()
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return searchResults.count
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendMessageTableViewCell", for: indexPath) as! friendMessageTableViewCell

        let friend = searchResults[indexPath.row]

        // 设置好友信息
        cell.uNameLabel.text = friend.uName
        cell.uWeekMilesLabel.text = String(format: " %.1f miles", friend.uWeekMiles)
        
        // 根据 uLevel 显示不同的等级文本
        switch friend.uLevel {
        case 1:
            cell.uLevelLabel.text = "Beginner"
        case 2:
            cell.uLevelLabel.text = "Intermediate"
        case 3:
            cell.uLevelLabel.text = "Advanced"
        case 4:
            cell.uLevelLabel.text = "Elite"
        default:
            cell.uLevelLabel.text = "Unknown"
        }
        
        cell.newLogo.isHidden = !addedFriendIDs.contains(friend.uID) // 默认隐藏，如果已添加则显示

        // 加载头像图片
        cell.head.image = UIImage(named: friend.headImage) // 从 Assets 中加载 headImage 对应的图片

        if !friendList.contains(friend.uID) {
            cell.addFriendButton.isHidden = false
            cell.addFriendButton.setTitle("Add", for: .normal)
            cell.addFriendButton.tag = friend.uID
            cell.addFriendButton.addTarget(self, action: #selector(addFriendTapped(_:)), for: .touchUpInside)
        } else {
            cell.addFriendButton.isHidden = true
        }

        return cell
    }

        @objc func addFriendTapped(_ sender: UIButton) {
            let friendID = sender.tag
            if !friendList.contains(friendID) {
                friendList.append(friendID)
                friendList.sort()
                addedFriendIDs.append(friendID) // 将已添加的好友ID加入跟踪列表
                
                // 清空搜索栏和搜索结果，刷新为完整好友列表
                searchBar.text = ""
                searchBar.resignFirstResponder() // 关闭键盘
                searchResults = friends
                loadFriends() // 重新加载表格数据以反映更新后的 friendList
            }
        }

        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let friendToRemove = searchResults[indexPath.row]
                if let index = friendList.firstIndex(of: friendToRemove.uID) {
                    friendList.remove(at: index)
                }
                friends.removeAll { $0.uID == friendToRemove.uID }
                searchResults.remove(at: indexPath.row)
                addedFriendIDs.removeAll { $0 == friendToRemove.uID } // 移除已添加列表中的ID
                tableView.deleteRows(at: [indexPath], with: .fade)
                noFriendsLabel.isHidden = !friends.isEmpty
            }
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            loadFriends()
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showChatFriendVC",
               let destinationVC = segue.destination as? chatFriendVC,
               let selectedIndexPath = tableView.indexPathForSelectedRow {
                let selectedFriend = searchResults[selectedIndexPath.row]
                destinationVC.uName = selectedFriend.uName
                destinationVC.uID = selectedFriend.uID
            }
        }
    }
