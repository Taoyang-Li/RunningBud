//
//  ChatMessageCell.swift
//  RunningBud
//
//  Created by chesterzhou on 10/12/24.
//

import UIKit

class ChatMessageCell: UITableViewCell {

    @IBOutlet weak var messageBackgroundView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    func configure(withMessage message: String, isFromUser: Bool) {
        messageLabel.text = message
        
        // 设置不同的对齐方式和背景颜色
        if isFromUser {
            messageLabel.textAlignment = .right
            messageBackgroundView.backgroundColor = UIColor.systemBlue
            
            // 将消息框移动到右侧
            messageLabel.frame = CGRect(x: self.contentView.frame.width - messageLabel.intrinsicContentSize.width - 20, y: 10, width: messageLabel.intrinsicContentSize.width, height: messageLabel.intrinsicContentSize.height)
            messageBackgroundView.frame = CGRect(x: self.contentView.frame.width - messageLabel.frame.width - 30, y: 5, width: messageLabel.frame.width + 20, height: messageLabel.frame.height + 10)
        } else {
            messageLabel.textAlignment = .left
            messageBackgroundView.backgroundColor = UIColor.systemGray
            
            // 将消息框固定在左侧
            messageLabel.frame = CGRect(x: 20, y: 10, width: messageLabel.intrinsicContentSize.width, height: messageLabel.intrinsicContentSize.height)
            messageBackgroundView.frame = CGRect(x: 10, y: 5, width: messageLabel.frame.width + 20, height: messageLabel.frame.height + 10)
        }
    }
}
