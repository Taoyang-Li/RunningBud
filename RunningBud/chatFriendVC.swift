//
//  chatFriendVC.swift
//  RunningBud
//
//  Created by chesterzhou on 10/26/24.
//

import UIKit

struct ChatFriendMessage {
    let text: String
    let isFromUser: Bool
}

class chatFriendVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var bottomView: UIStackView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var uName: String? // 接收传递的 uName
    var uID: Int?
    var chatMessages: [ChatFriendMessage] = []  // 存储聊天记录

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置标题为传递的 uName
        if let name = uName {
            userNameLabel.text = "Chatting with \(name)"
        }
        
        chatTableView.dataSource = self
        chatTableView.delegate = self
        messageTextField.delegate = self

        // 注册键盘显示和隐藏的通知
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @IBAction func sendMessage(_ sender: UIButton) {
        guard let message = messageTextField.text, !message.isEmpty else { return }

        // 添加用户消息
        chatMessages.append(ChatFriendMessage(text: message, isFromUser: true))
        messageTextField.text = ""  // 清空文本框

        // 刷新表格视图并滚动到底部
        chatTableView.reloadData()
        let lastIndex = IndexPath(row: chatMessages.count - 1, section: 0)
        chatTableView.scrollToRow(at: lastIndex, at: .bottom, animated: true)

        // 模拟对方的回复为 "Hello"，延迟0.5秒
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.chatMessages.append(ChatFriendMessage(text: "Hello", isFromUser: false))

            // 刷新表格视图并滚动到底部
            self.chatTableView.reloadData()
            let lastIndex = IndexPath(row: self.chatMessages.count - 1, section: 0)
            self.chatTableView.scrollToRow(at: lastIndex, at: .bottom, animated: true)
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatFriendCell", for: indexPath) as! ChatFriendCell
        let chatMessage = chatMessages[indexPath.row]
        cell.configure(withMessage: chatMessage.text, isFromUser: chatMessage.isFromUser)
        return cell
    }
}
