//
//  myGroupTableViewCell.swift
//  RunningBud
//
//  Created by chesterzhou on 11/6/24.
//

import UIKit

class myGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var lastsentence: UILabel!
    @IBOutlet weak var groupname: UILabel!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
