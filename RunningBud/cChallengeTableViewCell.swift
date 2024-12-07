//
//  cChallengeTableViewCell.swift
//  RunningBud
//
//  Created by chesterzhou on 9/26/24.
//

import UIKit

class cChallengeTableViewCell: UITableViewCell {
    @IBOutlet weak var cAcqu: UILabel!
    
    @IBOutlet weak var cDistance: UILabel!
    @IBOutlet weak var cFre: UILabel!
    @IBOutlet weak var cMember: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

