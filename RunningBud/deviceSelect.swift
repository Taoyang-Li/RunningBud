//
//  deviceSelect.swift
//  RunningBud
//
//  Created by chesterzhou on 9/30/24.
//

import UIKit

class deviceSelect: UIViewController {
    @IBOutlet weak var imageSliderView: ImageSlider!
    var selectedButton: String?
    var imageNames: [String] = ["ad1s", "ads2", "ads3", "ads4", "ads5","ads6","ads7"]
    override func viewDidLoad() {
        super.viewDidLoad()
        print("deviceSelect loaded")
        // Do any additional setup after loading the view.
        if paiedUser {
            imageSliderView.isHidden = true
            
        } else {
            imageSliderView.configure(with: imageNames, scrollInterval: 3.0)
        }
    }
    @IBAction func button1Tapped(_ sender: UIButton) {
            selectedButton = "Apple Watch"
        
                print("Button 1 tapped, selectedButton: \(selectedButton ?? "nil")")
        }

        // 第二个按钮的点击事件
        @IBAction func button2Tapped(_ sender: UIButton) {
            selectedButton = "Fitbit Watch"
            print("Button 2 tapped, selectedButton: \(selectedButton ?? "nil")")
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
