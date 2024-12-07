//
//  friendMessageTableViewCell.swift
//  RunningBud
//
//  Created by chesterzhou on 10/13/24.
//

import UIKit

class friendMessageTableViewCell: UITableViewCell {
    @IBOutlet weak var uIDLabel: UILabel!
    @IBOutlet weak var uNameLabel: UILabel!
    @IBOutlet weak var uWeekMilesLabel: UILabel!
    @IBOutlet weak var uLevelLabel: UILabel!
    @IBOutlet weak var newLogo: UIImageView!
    @IBOutlet weak var addFriendButton: UIButton!
    @IBOutlet weak var head: UIImageView!
    override func awakeFromNib() {
            super.awakeFromNib()
            // 隐藏 uIDLabel，不在界面中显示用户ID
            uIDLabel.isHidden = true
            
            // 确保 newLogo 位于 head UIImageView 的上方
            head.layer.zPosition = 0
            newLogo.layer.zPosition = 1
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            // Configure the view for the selected state
        }
    }
