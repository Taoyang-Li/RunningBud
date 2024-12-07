//
//  changeProfileViewController.swift
//  RunningBud
//
//  Created by chesterzhou on 11/14/24.
//

import UIKit

class changeProfileViewController: UIViewController {
    @IBOutlet weak var confirm: UIButton!
    @IBOutlet weak var oneNumber: UILabel!
    @IBOutlet weak var oneLetter: UILabel!
    @IBOutlet weak var specialCharacter: UILabel!
    @IBOutlet weak var eightCharacters: UILabel!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var newName: UITextField!
    @IBOutlet weak var uName: UILabel!
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var removeAds: UIButton!
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // 设置用户姓名和头像
            uName.text = userName
            if let image = UIImage(named: headLogin) {
                headImage.image = image
            }
            
            // 根据 paiedUser 状态调整界面
            if paiedUser {
                removeAds.isHidden = true
                uName.textColor = .systemYellow // 金色
            } else {
                removeAds.isHidden = false
                uName.textColor = .label // 默认颜色
            }
            
            // 添加对 newPassword 的编辑事件监听
            newPassword.addTarget(self, action: #selector(passwordTextChanged), for: .editingChanged)
        }
        
        @objc func passwordTextChanged() {
            let password = newPassword.text ?? ""
            
            // 检查是否至少包含8个字符
            eightCharacters.textColor = password.count >= 8 ? .green : .red
            
            // 检查是否包含至少一个特殊字符
            let specialCharacterRegex = ".*[^A-Za-z0-9].*"
            specialCharacter.textColor = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegex).evaluate(with: password) ? .green : .red
            
            // 检查是否至少包含一个字母
            let letterRegex = ".*[A-Za-z].*"
            oneLetter.textColor = NSPredicate(format: "SELF MATCHES %@", letterRegex).evaluate(with: password) ? .green : .red
            
            // 检查是否至少包含一个数字
            let numberRegex = ".*[0-9].*"
            oneNumber.textColor = NSPredicate(format: "SELF MATCHES %@", numberRegex).evaluate(with: password) ? .green : .red
        }
        
        @IBAction func confirmButtonTapped(_ sender: UIButton) {
            let newNameText = newName.text ?? ""
            let newPasswordText = newPassword.text ?? ""
            var nameChanged = false
            var passwordChanged = false
            var passwordValid = true
            
            // 检查密码是否符合要求
            let isEightCharacters = newPasswordText.count >= 8
            let hasSpecialCharacter = NSPredicate(format: "SELF MATCHES %@", ".*[^A-Za-z0-9].*").evaluate(with: newPasswordText)
            let hasLetter = NSPredicate(format: "SELF MATCHES %@", ".*[A-Za-z].*").evaluate(with: newPasswordText)
            let hasNumber = NSPredicate(format: "SELF MATCHES %@", ".*[0-9].*").evaluate(with: newPasswordText)
            
            passwordValid = isEightCharacters && hasSpecialCharacter && hasLetter && hasNumber
            
            // 检查新用户名
            if !newNameText.isEmpty && newNameText != userName {
                userName = newNameText
                uName.text = userName // 更新界面显示
                nameChanged = true
            }
            
            // 检查新密码
            if !newPasswordText.isEmpty && passwordValid {
                passwordChanged = true
            }
            
            // 根据情况弹出相应的提示框
            var message = ""
            if nameChanged && passwordChanged {
                message = "Name and Password changed successfully."
            } else if nameChanged {
                message = "Name change successful."
            } else if passwordChanged {
                message = "Password changed."
            } else if !passwordValid && !newPasswordText.isEmpty {
                message = "Password does not meet requirements."
            } else {
                message = "Nothing changed."
            }
            
            if !message.isEmpty {
                showAlert(message: message)
            }
        }
        
        func showAlert(message: String) {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        @IBAction func removeAdsButtonTapped(_ sender: UIButton) {
            let alert = UIAlertController(title: "Upgrade to Premium", message: "Enter your payment details", preferredStyle: .alert)
            
            alert.addTextField { textField in
                textField.placeholder = "Card Number"
                textField.keyboardType = .numberPad
            }
            
            alert.addTextField { textField in
                textField.placeholder = "Expiration Date (MM/YY)"
            }
            
            alert.addTextField { textField in
                textField.placeholder = "CVV"
                textField.keyboardType = .numberPad
            }
            
            alert.addAction(UIAlertAction(title: "Upgrade", style: .default, handler: { _ in
                // 用户确认升级
                paiedUser = true
                self.removeAds.isEnabled = false
                self.removeAds.setTitleColor(.systemYellow, for: .normal) // 设置按钮文字为金色
                self.uName.textColor = .systemYellow // 用户名也变成金色
                self.removeAds.setTitle("Ads Removed", for: .normal) // 更新按钮标题
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            present(alert, animated: true, completion: nil)
        }
    }
