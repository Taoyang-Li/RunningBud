//
//  RegisterVC.swift
//  RunningBud
//
//  Created by chesterzhou on 9/18/24.
//

import UIKit

class RegisterVC: UIViewController {
    @IBOutlet weak var oneNumber: UILabel!
    @IBOutlet weak var oneLetter: UILabel!
    @IBOutlet weak var specialCharacter: UILabel!
    @IBOutlet weak var eightCharacters: UILabel!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errorMassage: UILabel!
    override func viewDidLoad() {
            super.viewDidLoad()
            // 添加对 passwordText 的编辑事件监听
            passwordText.addTarget(self, action: #selector(passwordTextChanged), for: .editingChanged)
        }
        
    @objc func passwordTextChanged() {
        let password = passwordText.text ?? ""
        
        // 检查是否至少包含8个字符
        if password.count >= 8 {
            eightCharacters.textColor = .green
        } else {
            eightCharacters.textColor = .red
        }
        
        // 检查是否包含至少一个特殊字符
        let specialCharacterRegex = ".*[^A-Za-z0-9].*"
        if NSPredicate(format: "SELF MATCHES %@", specialCharacterRegex).evaluate(with: password) {
            specialCharacter.textColor = .green
        } else {
            specialCharacter.textColor = .red
        }
        
        // 检查是否至少包含一个字母
        let letterRegex = ".*[A-Za-z].*"
        if NSPredicate(format: "SELF MATCHES %@", letterRegex).evaluate(with: password) {
            oneLetter.textColor = .green
        } else {
            oneLetter.textColor = .red
        }
        
        // 检查是否至少包含一个数字
        let numberRegex = ".*[0-9].*"
        if NSPredicate(format: "SELF MATCHES %@", numberRegex).evaluate(with: password) {
            oneNumber.textColor = .green
        } else {
            oneNumber.textColor = .red
        }
    }

    @IBAction func clickLoginButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "toRegisterSuccess" else { return true }
        
        let username = userNameText.text ?? ""
        if username.isEmpty {
            errorMassage.text = "Please enter User Name"
            return false
        }
        
        let password = passwordText.text ?? ""
        if password.isEmpty {
            errorMassage.text = "Please enter Password"
            return false
        }
        
        // 检查密码是否符合所有要求
        let isEightCharacters = password.count >= 8
        let hasSpecialCharacter = NSPredicate(format: "SELF MATCHES %@", ".*[^A-Za-z0-9].*").evaluate(with: password)
        let hasLetter = NSPredicate(format: "SELF MATCHES %@", ".*[A-Za-z].*").evaluate(with: password)
        let hasNumber = NSPredicate(format: "SELF MATCHES %@", ".*[0-9].*").evaluate(with: password)
        
        if isEightCharacters && hasSpecialCharacter && hasLetter && hasNumber {
            errorMassage.text = nil
            return true
        } else {
            errorMassage.text = "Password does not meet the requirements"
            return false
        }
    }
}
