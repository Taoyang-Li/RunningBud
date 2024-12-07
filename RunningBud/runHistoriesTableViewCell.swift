//
//  runHistoriesTableViewCell.swift
//  RunningBud
//
//  Created by chesterzhou on 11/8/24.
//

import UIKit

class runHistoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var runSpace: UILabel!
    @IBOutlet weak var runCal: UILabel!
    @IBOutlet weak var runDate: UILabel!
    @IBOutlet weak var runDis: UILabel!
    @IBOutlet weak var runImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
