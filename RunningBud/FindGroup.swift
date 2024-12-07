//
//  FindGroup.swift
//  RunningBud
//
//  Created by chesterzhou on 9/26/24.
//

import UIKit

class FindGroup: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var distancePickView: UIPickerView!
    let distancePV = ["1","5","10","20","30","40","50","60","70","80","90","100",]
    @IBOutlet weak var frquencePickView: UIPickerView!
    let frequencePV = ["1 Times a Week","2 Times a Week","3 Times a Week","4 Times a Week","5 Times a Week","6 Times a Week","7 Times a Week","In 1 month"]
   
    var couponChallengesList = cChallenges()
    var selectedVdistance: String?
    var selectedfrquence: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        distancePickView.delegate = self
        distancePickView.dataSource = self
        frquencePickView.delegate = self
        frquencePickView.dataSource = self
        
        distancePickView.tag = 1
        frquencePickView.tag = 2

        // Do any additional setup after loading the view.
    }
    
    // 返回 UIPickerView 中的列数，每个 pickerView 只有一列
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 返回每个 UIPickerView 中的行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return distancePV.count
        } else if pickerView.tag == 2 {
            return frequencePV.count
        }
        return 0
    }
    
    // 设置每一行显示的内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return distancePV[row]
        } else if pickerView.tag == 2 {
            return frequencePV[row]
        }
        return nil
    }
    
    // 捕获选中的值
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            selectedVdistance = distancePV[row]
            print("Picker 1 selected value: \(selectedVdistance ?? "")")
        } else if pickerView.tag == 2 {
            selectedfrquence = frequencePV[row]
            print("Picker 2 selected value: \(selectedfrquence ?? "")")
        }
    }
    
    // 准备传递数据到下一个页面
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCouponChallengList" {
            if let destinationVC = segue.destination as? couponChallenge {
                // 传递选中值到 couponChallenge
                destinationVC.distanceSelect = Int(distancePV[distancePickView.selectedRow(inComponent: 0)])
                destinationVC.frequenceSelect = frequencePV[frquencePickView.selectedRow(inComponent: 0)]
            }
        } else if segue.identifier == "toMoneyChallengList" {
            if let destinationVC = segue.destination as? moneyChallenge {
                // 传递选中值到 moneyChallenge
                destinationVC.distanceSelect = Int(distancePV[distancePickView.selectedRow(inComponent: 0)])
                destinationVC.frequenceSelect = frequencePV[frquencePickView.selectedRow(inComponent: 0)]
            }
        }
    }
}
