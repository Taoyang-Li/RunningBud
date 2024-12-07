//
//  myGroupChatViewController.swift
//  RunningBud
//
//  Created by chesterzhou on 11/6/24.
//

import UIKit


class myGroupChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
   
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var bottomView: UIStackView!
    @IBOutlet weak var groupNameLabel: UILabel!
    var groupID: Int?
        var chatMessages: [ChatFriendMessage] = []
        var group: myGroup? // 当前组的引用

        override func viewDidLoad() {
            super.viewDidLoad()

            // 获取对应的group并设置名称
            if let groupID = groupID {
                if let matchedGroup = myGroups().groups.first(where: { $0.myGroupID == groupID }) {
                    self.group = matchedGroup
                    self.groupNameLabel.text = matchedGroup.myGroupName
                    
                    // 将 chatMess 初始化为 ChatFriendMessage，用户消息会右对齐
                    for message in matchedGroup.chatMess {
                        let isFromUser = message.starts(with: "$\(userName)$:")
                        chatMessages.append(ChatFriendMessage(text: message, isFromUser: isFromUser))
                    }
                }
            }
            
            chatTableView.dataSource = self
            chatTableView.delegate = self
            messageTextField.delegate = self
            
            // 动态行高设置
            chatTableView.estimatedRowHeight = 44.0
            chatTableView.rowHeight = UITableView.automaticDimension
            
            // 注册键盘通知
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

        deinit {
            NotificationCenter.default.removeObserver(self)
        }

        @IBAction func sendMessage(_ sender: UIButton) {
            guard let messageText = messageTextField.text, !messageText.isEmpty, let group = group else { return }

            // 在消息文本前添加用户名格式，并标记为用户发送的消息
            let userMessage = "$\(userName)$: \(messageText)"
            group.chatMess.append(userMessage) // 添加到 group 的 chatMess 中
            print("Message sent: \(userMessage)")

            // 添加消息到 chatMessages，标记为用户消息
            chatMessages.append(ChatFriendMessage(text: userMessage, isFromUser: true))
            messageTextField.text = ""
            
            // 刷新表格并滚动到底部
            chatTableView.reloadData()
            let lastIndex = IndexPath(row: chatMessages.count - 1, section: 0)
            chatTableView.scrollToRow(at: lastIndex, at: .bottom, animated: true)
            
            // 发送通知以更新 myGroupViewController 中的 last sentence
            NotificationCenter.default.post(name: Notification.Name("UpdateLastMessage"), object: nil, userInfo: ["lastMessage": userMessage, "groupID": groupID!])
        }

        @objc func keyboardWillShow(_ notification: Notification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                let keyboardHeight = keyboardSize.height
                UIView.animate(withDuration: 0.3) {
                    self.bottomView.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight)
                    self.chatTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
                }
            }
        }

        @objc func keyboardWillHide(_ notification: Notification) {
            UIView.animate(withDuration: 0.3) {
                self.bottomView.transform = .identity
                self.chatTableView.contentInset = .zero
            }
        }

        // UITextFieldDelegate 方法
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            sendMessage(sendButton)
            return true
        }

        // UITableView 数据源方法
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return chatMessages.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupChatTableViewCell", for: indexPath) as! myGroupChatTableViewCell
            let message = chatMessages[indexPath.row]
            
            // 根据消息来源显示格式
            cell.configure(withMessage: message.text, isFromUser: message.isFromUser)
            return cell
        }
    }
