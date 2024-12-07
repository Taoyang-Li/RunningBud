//
//  cGroupJoinSuccess.swift
//  RunningBud
//
//  Created by chesterzhou on 9/27/24.
//

import UIKit

class cGroupJoinSuccess: UIViewController {
    @IBOutlet weak var joinedSuccessLabel: UILabel!
    var groupID: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let groupID = groupID {
            joinedSuccessLabel.text = "\(groupID) has joined success"
        }
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
