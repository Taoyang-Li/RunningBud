//
//  profileViewController.swift
//  RunningBud
//
//  Created by chesterzhou on 10/27/24.
//

import UIKit

class profileViewController: UIViewController {

    @IBOutlet weak var ttKcal: UILabel!
    @IBOutlet weak var ttMile: UILabel!
    @IBOutlet weak var ttHours: UILabel!
    @IBOutlet weak var displayUserLevel: UILabel!
    @IBOutlet weak var dispalyUserserImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = userName
        switch userLevel {
        case 1:
            self.displayUserLevel.text = "Level:Beginner"
        case 2:
            self.displayUserLevel.text = "Level:Intermediate"
        case 3:
            self.displayUserLevel.text = "Level:Advanced"
        case 4:
            self.displayUserLevel.text = "Level:Elite"
        default:
            self.displayUserLevel.text = "Level:Unknown Level"
        }
        if let userImage = UIImage(named: headLogin) {
                dispalyUserserImage.image = userImage
            } else {
                print("图片名称 \(headLogin) 未找到")
            }
        ttKcal.text = String(tKcal)
        ttMile.text = String(tMile)
        ttHours.text = String(tHour)

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 更新用户名显示
        name.text = userName
        
        // 根据 paiedUser 状态设置用户名颜色
        if paiedUser {
            name.textColor = .systemYellow // 金色
        } else {
            name.textColor = .label // 默认颜色
        }
    }
    
    @IBAction func personalParameters(_ sender: UITapGestureRecognizer) {
        print("personalParameters tapped!")
        performSegue(withIdentifier: "topersonalParameters", sender: self)
    }
    
    @IBAction func achievement(_ sender: UITapGestureRecognizer) {
        print("achievement tapped!")
        performSegue(withIdentifier: "toAchievement", sender: self)
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
