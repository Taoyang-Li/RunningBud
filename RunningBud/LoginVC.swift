//
//  LoginVC.swift
//  RunningBud
//
//  Created by chesterzhou on 9/18/24.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errorMassage: UILabel!
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            errorMassage.text = ""
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toHomePage" {
                if let tabBarController = segue.destination as? UITabBarController {
                    if let navController = tabBarController.viewControllers?.first as? UINavigationController,
                       let _ = navController.viewControllers.first as? homePage {
                        
                    }
                }
            }
        }
        
        override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            guard identifier == "toHomePage" else { return true }
            
            let username = userNameText.text ?? ""
            let password = passwordText.text ?? ""
            
            // 检查是否输入了用户名和密码
            if username.isEmpty {
                errorMassage.text = "Please enter User Name"
                return false
            }
            
            if password.isEmpty {
                errorMassage.text = "Please enter Password"
                return false
            }
            
            // 验证账户和密码
            if let matchedUser = logUsers().loginUsers.first(where: { $0.loginName == username && $0.loginPassWord == password }) {
                // 匹配成功时，将信息存储到 DataStore 中
                userName = matchedUser.loginName
                userLevel = matchedUser.LoginLevel
                joinedGroup = matchedUser.loginJoinedGroup
                friendList = matchedUser.loginFriendList
                headLogin = matchedUser.loginHeadImage
                paiedUser = matchedUser.loginPaied
                tMile = matchedUser.totalMile
                tHour = matchedUser.totalHour
                tKcal = matchedUser.totalKcal
                // 打印信息
                print("User Name: \(userName)")
                print("User Level: \(userLevel)")
                print("Joined Group: \(joinedGroup)")
                print("Friend List: \(friendList)")
                print("Head Image: \(headLogin)")
                print("Paid User: \(paiedUser)")
                
                errorMassage.text = nil // 清空错误信息
                return true
            } else {
                // 账户或密码不匹配
                errorMassage.text = "Invalid User Name or Password"
                return false
            }
        }
    }
