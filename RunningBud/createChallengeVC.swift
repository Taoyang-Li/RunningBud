//
//  createChallengeVC.swift
//  RunningBud
//
//  Created by chesterzhou on 10/18/24.
//

import UIKit
protocol CreateChallengeDelegate: AnyObject {
    func didCreateGroup(_ group: myGroup)
}

class createChallengeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Outlet for TableView
    @IBOutlet weak var createGroup: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var groupName: UITextField!
    @IBOutlet weak var Description: UITextField!
    
    @IBOutlet weak var allowToJoin: UISwitch!
    weak var delegate: CreateChallengeDelegate?
        var allFriends: [user] = []
        var selectedFriends: [Int] = []
        var groupsData = myGroups()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.delegate = self
            tableView.dataSource = self
            
            for friendID in friendList {
                if let friend = users().uUsers.first(where: { $0.uID == friendID }) {
                    allFriends.append(friend)
                }
            }
        }
        
        // MARK: - TableView DataSource Methods
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return allFriends.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "createGroupCell", for: indexPath) as! createGroupTableViewCell
            let friend = allFriends[indexPath.row]
            
            cell.uName.text = friend.uName
            cell.uID.text = "ID: \(friend.uID)"
            cell.uID.isHidden = true
            cell.headImage.image = UIImage(named: friend.headImage)
            
            let isFriendSelected = selectedFriends.contains(friend.uID)
            let buttonImage = UIImage(systemName: isFriendSelected ? "plus.app.fill" : "plus.app")
            cell.addFriendBottom.setImage(buttonImage, for: .normal)
            
            cell.addFriendBottom.tag = indexPath.row
            cell.addFriendBottom.addTarget(self, action: #selector(toggleFriendSelection(_:)), for: .touchUpInside)
            
            return cell
        }
        
        @objc func toggleFriendSelection(_ sender: UIButton) {
            let friendID = allFriends[sender.tag].uID
            if let index = selectedFriends.firstIndex(of: friendID) {
                selectedFriends.remove(at: index)
            } else {
                selectedFriends.append(friendID)
            }
            tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
        }
        
        // MARK: - Create Group Button Action
        @IBAction func createGroupTapped(_ sender: UIButton) {
            guard let groupNameValue = groupName.text, !groupNameValue.isEmpty else {
                showAlert(message: "Group name cannot be empty.")
                return
            }
            
            guard !selectedFriends.isEmpty else {
                showAlert(message: "Please select at least one friend to create a group.")
                return
            }
            
            let descriptionValue = Description.text ?? "No Description"
            let allowToJoinValue = allowToJoin.isOn
            let nextGroupID = (groupsData.groups.last?.myGroupID ?? 0) + 1
            
            let cGroup = myGroup(myGroupID: nextGroupID,
                                 myGroupName: groupNameValue,
                                 memberID: selectedFriends,
                                 chatMess: [],
                                 chatMember: [],
                                 description: descriptionValue,
                                 cType: "",
                                 allowToJoin: allowToJoinValue)
            
            // 打印调试信息，检查创建的 cGroup 的内容
            print("New group created in createChallengeVC:")
            print("Group ID: \(cGroup.myGroupID), Name: \(cGroup.myGroupName), Members: \(cGroup.memberID)")
            
            groupsData.groups.append(cGroup)
            myGroups().groups.append(cGroup)
            
            delegate?.didCreateGroup(cGroup)
            navigationController?.popViewController(animated: true)
        }
        
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        }
    }
