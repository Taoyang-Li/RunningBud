//
//  groupMemberTableViewCell.swift
//  RunningBud
//
//  Created by chesterzhou on 10/4/24.
//

import UIKit

class groupMemberTableViewCell: UITableViewCell {
    
    @IBOutlet weak var uLevel: UILabel!
    
    @IBOutlet weak var uTotalMiles: UILabel!
    @IBOutlet weak var uName: UILabel!
    @IBOutlet weak var uID: UILabel!
    
    @IBOutlet weak var head: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var addFriendButton: UIButton!
    var isLiked = false // 用于跟踪按钮是否被点击
        var userID: Int? // 用于存储当前用户的 uID
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
        }
        
        // 点赞按钮点击事件
        @IBAction func likeButtonTapped(_ sender: UIButton) {
            isLiked.toggle() // 切换状态
            updateLikeButton() // 更新按钮外观
        }
        
        // 更新点赞按钮的显示
        func updateLikeButton() {
            if isLiked {
                likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal) // 点亮
            } else {
                likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal) // 取消点亮
            }
        }
        
        @IBAction func addFriendButtonTapped(_ sender: UIButton) {
            // 检查 userID 是否有效
            guard let userID = userID else {
                showAlert(title: "Fail", message: "Invalid user ID.") // 显示错误提示
                return
            }
            
            // 检查 friendList 是否已经包含该用户
            if friendList.contains(userID) {
                showAlert(title: "Fail", message: "This user is already your friend.")
            } else {
                // 将用户ID添加到friendList并排序
                friendList.append(userID)
                friendList.sort()
                showAlert(title: "Success", message: "Friend added successfully.")
            }
        }
        
        // 显示警告提示框
        func showAlert(title: String, message: String) {
            if let parentVC = self.parentViewController {
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                parentVC.present(alert, animated: true, completion: nil)
            }
        }
    }

    // MARK: - Extension to get parent view controller from UITableViewCell
    extension UIView {
        var parentViewController: UIViewController? {
            var parentResponder: UIResponder? = self
            while parentResponder != nil {
                parentResponder = parentResponder?.next
                if let viewController = parentResponder as? UIViewController {
                    return viewController
                }
            }
            return nil
        }
    }
