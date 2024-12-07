//
//  cChallengeDetail.swift
//  RunningBud
//
//  Created by chesterzhou on 9/26/24.
//

import UIKit

class cChallengeDetail: UIViewController {

    @IBOutlet weak var Acqu: UILabel!
    @IBOutlet weak var TotalDis: UILabel!
    @IBOutlet weak var Member: UILabel!
    @IBOutlet weak var Fre: UILabel!
    @IBOutlet weak var Distance: UILabel!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var ID: UILabel!
    
    @IBOutlet weak var groupLevel: UILabel!
    var cID: String?
        var cName: String?
        var cDistance: String?
        var cFrequence: String?
        var cMember: String?
        var cTotalDistance: String?
        var cAcquire: String?
        var challenge: challenge?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // 更新 UI 显示 challenge 详细信息
            if let cID = cID {
                ID.text = "Group ID: \(cID)"
                challenge = cChallenges().couChals.first(where: { "\($0.cID)" == cID })
            }
            
            Name.text = "Name of Group: \(cName ?? "N/A")"
            Distance.text = "Distance: \(cDistance ?? "N/A") miles"
            Fre.text = cFrequence
            Member.text = "Number of users in this group: \(cMember ?? "N/A")"
            Acqu.text = cAcquire
            TotalDis.text = "Total Distance running: \(cTotalDistance ?? "N/A") miles"
            
            // 设置用户级别显示
            if let level = challenge?.cHardLevel {
                groupLevel.text = levelText(for: level)
            }
        }
        
        func levelText(for level: Int) -> String {
            switch level {
            case 1: return "Beginner"
            case 2: return "Intermediate"
            case 3: return "Advanced"
            case 4: return "Elite"
            default: return "Unknown"
            }
        }
        
        @IBAction func joinGroupButtonTapped(_ sender: UIButton) {
            guard let challenge = challenge, let groupID = cID else {
                showAlert(message: "Challenge not found.")
                return
            }
            if joinedGroup.contains(groupID) {
                    showAlert(message: "You have already joined this challenge.")
                    return
                }
            // 判断用户级别是否满足加入条件
            if userLevel != challenge.cHardLevel {
                showAlert(message: "Your level cannot join this group.")
                return
            }

            // 检查是否已加入相同类型的挑战
            let existingCouponCount = joinedGroup.filter { id in
                cChallenges().couChals.first(where: { "\($0.cID)" == id })?.cType == "Coupon"
            }.count
            let existingMoneyCount = joinedGroup.filter { id in
                cChallenges().couChals.first(where: { "\($0.cID)" == id })?.cType == "Money"
            }.count

            if challenge.cType == "Coupon", existingCouponCount >= 5 {
                showAlert(message: "You can only join a maximum of 5 Coupon challenges.")
                return
            } else if challenge.cType == "Money", existingMoneyCount >= 1 {
                showAlert(message: "You can only join 1 Money challenge.")
                return
            }

            // 针对 Money 类型弹出支付信息窗口
            if challenge.cType == "Money" {
                showPaymentAlert()
            } else {
                proceedToJoin(groupID)
            }
        }
        
        func showPaymentAlert() {
            let alert = UIAlertController(title: "Payment Required", message: "Please enter your card details.", preferredStyle: .alert)
            alert.addTextField { $0.placeholder = "Card Number"; $0.keyboardType = .numberPad }
            alert.addTextField { $0.placeholder = "Expiration Date (MM/YY)" }
            alert.addTextField { $0.placeholder = "CVV"; $0.keyboardType = .numberPad }
            
            if let acquireText = cAcquire {
                alert.message = "\(alert.message!)\nCharge: \(acquireText)"
            }
            
            let joinAction = UIAlertAction(title: "Join", style: .default) { _ in
                if let groupID = self.cID { self.proceedToJoin(groupID) }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(joinAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true)
        }
        
        func proceedToJoin(_ groupID: String) {
            joinedGroup.append(groupID)
            performSegue(withIdentifier: "tocGroupJoinSuccess", sender: self)
        }
        
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
