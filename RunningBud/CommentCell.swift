//
//  CommentCell.swift
//  RunningBud
//
//  Created by chesterzhou on 11/12/24.
//


import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var uNameLabel: UILabel!  // 用户名标签
    @IBOutlet weak var uCommentLabel: UILabel!  // 评论标签
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            if uNameLabel != nil {
                print("uNameLabel is connected.")
            } else {
                print("uNameLabel is NOT connected.")
            }
            
            if uCommentLabel != nil {
                print("uCommentLabel is connected.")
            } else {
                print("uCommentLabel is NOT connected.")
            }
        }
    }
