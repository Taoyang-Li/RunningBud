//
//  momentsTableViewCell.swift
//  RunningBud
//
//  Created by chesterzhou on 10/30/24.
//

import UIKit

class momentsTableViewCell: UITableViewCell {

    @IBOutlet weak var likebottom: UIButton!
    @IBOutlet weak var challengetype: UILabel!
    @IBOutlet weak var timerun: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var shareImage2: UIImageView!
    @IBOutlet weak var shareImage1: UIImageView!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var uName: UILabel!
    @IBOutlet weak var head: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
