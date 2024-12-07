//
//  createGroupTableViewCell.swift
//  RunningBud
//
//  Created by chesterzhou on 10/18/24.
//

import UIKit

class createGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var addFriendBottom: UIButton!
    @IBOutlet weak var uName: UILabel!
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var uID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
