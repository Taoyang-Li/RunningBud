//
//  cGroupJoinedTableViewCell.swift
//  RunningBud
//
//  Created by chesterzhou on 9/27/24.
//

import UIKit

class cGroupJoinedTableViewCell: UITableViewCell {

    @IBOutlet weak var Acqlabel: UILabel!
    @IBOutlet weak var Typlabel: UILabel!
    @IBOutlet weak var Frelabel: UILabel!
    @IBOutlet weak var Dislabel: UILabel!
   
    @IBOutlet weak var IDlabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
