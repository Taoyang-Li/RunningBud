//
//  couponChallenge.swift
//  RunningBud
//
//  Created by chesterzhou on 9/26/24.
//

import UIKit

class couponChallenge: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var couponChalleng: UITableView!
    var distanceSelect:Int?
    var frequenceSelect:String?
    
    var couponChallengesList = cChallenges() // 引入之前的 couponChallenges 数据
    var sortedChallengesList: [challenge] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置数据源和代理
        couponChalleng.delegate = self
        couponChalleng.dataSource = self
        
        print("Distance selected value: \(distanceSelect ?? 0)")
        print("Picker 2 selected value: \(frequenceSelect ?? "No value")")
        
        // 安全解包 distanceSelect 和 frequenceSelect
        guard let distanceInt = distanceSelect, let frequencyString = frequenceSelect else {
            print("Error: distance or frequency not set")
            return
        }
        
        // 调用排序函数，传入 self 以便在需要时展示 UIAlertController
        sortedChallengesList = sortChallenges(by: distanceInt, frequency: frequencyString, challenges: couponChallengesList.couChals, viewController: self)
        
        for challenge in sortedChallengesList {
            print("Challenge ID: \(challenge.cID)")
            print("Name: \(challenge.cName)")
            print("Distance: \(challenge.cDistance)")
            print("Frequency: \(challenge.cFrequence)")
            print("Members: \(challenge.cMember)")
            print("Total Distance: \(challenge.cTotalDistance)")
            print("No.1 ID: \(challenge.cNo1ID)")
            print("Type: \(challenge.cType)")
            print("Acquire: \(challenge.cAcquire)")
            print("Description: \(challenge.cDescrible)")
        }
        
        // 刷新表格视图显示排序后的数据
        couponChalleng.reloadData()
    }
                
    // MARK: - UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedChallengesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cChallengeTableViewCell", for: indexPath) as! cChallengeTableViewCell
        
        let challenge = sortedChallengesList[indexPath.row]
        
        cell.cDistance.text = "Dis: \(challenge.cDistance)mile"
        cell.cFre.text = "Fre:\(challenge.cFrequence)"
         
        cell.cAcqu.text = challenge.cAcquire
        switch challenge.cHardLevel {
        case 1:
            cell.cMember.text = "Level:Beginner"
        case 2:
            cell.cMember.text = "Level:Intermediate"
        case 3:
            cell.cMember.text = "Level:Advanced"
        case 4:
            cell.cMember.text = "Level:Elite"
        default:
            cell.cMember.text = "Level:Unknown Level"
        }
        
        return cell
    }
    
    // 不需要在 didSelectRowAt 中保存 selectedCID
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 这里只需要处理点击事件，不需要手动保存数据或执行 segue
    }
    
    // 准备传递数据到下一个页面
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCCDetail" {
            if let destinationVC = segue.destination as? cChallengeDetail,
               let indexPath = couponChalleng.indexPathForSelectedRow {  // 获取当前选中的行
                
                // 通过 indexPath 获取选中的 cID
                let selectedChallenge = sortedChallengesList[indexPath.row]
                destinationVC.cID = String(selectedChallenge.cID)
                destinationVC.cName = selectedChallenge.cName
                destinationVC.cDistance = String(selectedChallenge.cDistance)
                destinationVC.cFrequence = selectedChallenge.cFrequence
                destinationVC.cMember = String(selectedChallenge.cMember)
                destinationVC.cTotalDistance = String(selectedChallenge.cTotalDistance)
                destinationVC.cMember = String(selectedChallenge.cMember)
                destinationVC.cAcquire = selectedChallenge.cAcquire
            }
        }
    }
    
    // MARK: - Sort Challenges Function
    func sortChallenges(by distance: Int, frequency: String, challenges: [challenge], viewController: UIViewController) -> [challenge] {
        print("Sorting with distance: \(distance), frequency: \(frequency)")
        
        // 首先筛选出所有 cType 为 "Coupon" 的挑战
        let couponChallenges = challenges.filter { $0.cType == "Coupon" }
        
        // 1. 找到所有 cDistance 匹配的 Coupon 类型 challenges
        let matchingDistanceChallenges = couponChallenges.filter { $0.cDistance == distance }

        // 2. 如果没有匹配的 distance，弹出报错窗口并返回原列表
        if matchingDistanceChallenges.isEmpty {
            // 弹出提示框
            let alert = UIAlertController(title: "No Match", message: "No coupon challenges found matching the distance.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            viewController.present(alert, animated: true, completion: nil)
            
            // 返回筛选后的 coupon challenges 列表
            return couponChallenges
        }

        // 3. 在匹配的 distance 中找到 frequency 也匹配的 challenge
        if let matchingChallengeIndex = matchingDistanceChallenges.firstIndex(where: { $0.cFrequence == frequency }) {
            var sortedChallenges = matchingDistanceChallenges
            // 4. 将 frequency 和 distance 都匹配的 challenge 排到第一个
            let matchingChallenge = sortedChallenges.remove(at: matchingChallengeIndex) // 从原数组中移除
            sortedChallenges.insert(matchingChallenge, at: 0) // 插入到第一个位置
            print("Matching challenge found with ID: \(matchingChallenge.cID)")
            
            // 5. 把剩下的非匹配 distance 的 challenges 添加到结果后面
            let remainingChallenges = couponChallenges.filter { $0.cDistance != distance }
            return sortedChallenges + remainingChallenges
        }
        
        // 如果没有 frequency 匹配的，但有 distance 匹配的，只返回所有 distance 匹配的 challenges 排在前面
        print("No matching challenge found for frequency, but distance matches.")
        let remainingChallenges = couponChallenges.filter { $0.cDistance != distance }
        return matchingDistanceChallenges + remainingChallenges
    }


}



/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
}
*/


