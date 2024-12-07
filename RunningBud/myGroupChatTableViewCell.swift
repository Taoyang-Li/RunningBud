//
//  myGroupChatTableViewCell.swift
//  RunningBud
//
//  Created by chesterzhou on 11/6/24.
//

import UIKit

class myGroupChatTableViewCell: UITableViewCell {

    @IBOutlet weak var messageBackgroundView: UIView!
    @IBOutlet weak var messageLabel: UILabel!

    @IBOutlet weak var userName: UILabel!
    func configure(withMessage message: String, isFromUser: Bool) {
            messageLabel.numberOfLines = 0 // 支持多行显示
            messageLabel.textAlignment = isFromUser ? .right : .left
            messageBackgroundView.backgroundColor = isFromUser ? UIColor.systemGreen : UIColor.systemGray

            // 提取用户名和消息内容
            let (username, content) = extractUsernameAndContent(from: message)
            
            // 设置用户名和消息内容
            userName.text = username
            messageLabel.text = content
            
            // 设置最大宽度并计算动态尺寸
            let maxWidth: CGFloat = 280
            let messageSize = messageLabel.sizeThatFits(CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude))
            
            // 根据消息来源设置位置
            let xPosition = isFromUser ? UIScreen.main.bounds.width - messageSize.width - 40 : 20
            messageLabel.frame = CGRect(x: xPosition, y: 10, width: min(messageSize.width, maxWidth), height: messageSize.height)
            messageBackgroundView.frame = CGRect(x: xPosition - 10, y: 5, width: min(messageSize.width, maxWidth) + 20, height: messageSize.height + 10)
        }
        
        private func extractUsernameAndContent(from message: String) -> (String, String) {
            let pattern = "\\$(.*?)\\$" // 匹配在两个 $ 符号之间的内容
            if let regex = try? NSRegularExpression(pattern: pattern),
               let match = regex.firstMatch(in: message, range: NSRange(message.startIndex..., in: message)) {
                
                if let range = Range(match.range(at: 1), in: message) {
                    let username = String(message[range])
                    let contentStartIndex = message.index(range.upperBound, offsetBy: 2) // 跳过 $ 符号和冒号
                    let content = String(message[contentStartIndex...])
                    return (username, content)
                }
            }
            return ("", message) // 如果没有用户名格式，则返回整个消息内容
        }
    }
