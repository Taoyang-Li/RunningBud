//
//  momentsVC.swift
//  RunningBud
//
//  Created by chesterzhou on 10/30/24.
//

import UIKit

// 定义 Moment 结构体
struct Moment {
    var userName: String
    var contentText: String
    var location: String
    var distance: String
    var timeRun: String
    var challengeType: String
    var headImageName: String
    var shareImage1Name: String
    var shareImage2Name: String
    var isLiked: Bool = false  // 用于记录点赞状态
}

class momentsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addMoment: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // 定义好友动态的数组
    var moments: [Moment] = [
        Moment(userName: "Raymond", contentText: "Just finished an amazing morning run! Feeling energized and ready to tackle the day! 🌅 #morningrun #runnerlife", location: "Central Park-New York City", distance: "5 mile", timeRun: "30 mins", challengeType: "Beginer", headImageName: "M12", shareImage1Name: "run1", shareImage2Name: "run2"),
        Moment(userName: "Shirley", contentText: "Pushed my limits today with a new personal best! 10K in under an hour! 🏃‍♂️💪 #goals #runhappy", location: "Times Square-New York City", distance: "10 mile", timeRun: "45 mins", challengeType: "Intermediate", headImageName: "F12", shareImage1Name: "run3", shareImage2Name: "run4"),
        Moment(userName: "Sandra", contentText: "Enjoyed a beautiful trail run by the lake. The scenery was breathtaking! 🏞️ #naturelover #runfree", location: "Hollywood Walk of Fame-Los Angeles", distance: "7 mile", timeRun: "60 mins", challengeType: "Advanced", headImageName: "F8", shareImage1Name: "run5", shareImage2Name: "run6"),
        Moment(userName: "Thomas", contentText: "Evening run complete! Nothing beats the cool breeze and city lights. 🌆 #nightowlrunner #keepgoing", location: "Golden Gate Bridge-San Francisco", distance: "6.5 mile", timeRun: "54 mins", challengeType: "Advanced", headImageName: "M6", shareImage1Name: "run7", shareImage2Name: "run8"),
        Moment(userName: "Eric", contentText: "Joined a group run today, and the motivation was incredible! Running truly connects people. 🤝 #community #runtogether", location: "Cloud Gate-Chicago", distance: "3 mile", timeRun: "25 mins", challengeType: "Elite", headImageName: "M3", shareImage1Name: "run9", shareImage2Name: "run10")
    ]
    
    // 圆形按钮的半径（可以根据需求调整）
    let buttonCornerRadius: CGFloat = 25 // 圆形按钮的大小半径，您可以调整此值
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置 TableView
        tableView.delegate = self
        tableView.dataSource = self
        
        // 设置按钮初始位置（例如屏幕右上角，距右侧 20 点，距顶部 100 点）
        addMoment.frame = CGRect(x: view.frame.width - 70, y: 100, width: 50, height: 50)
        
        // 设置按钮外观为圆形
        addMoment.layer.cornerRadius = buttonCornerRadius
        addMoment.clipsToBounds = true
        
        // 取消按钮的自动布局约束，使其可以自由移动
        addMoment.translatesAutoresizingMaskIntoConstraints = true
        
        // 添加拖动手势到 addMoment 按钮
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        addMoment.addGestureRecognizer(panGesture)
        
        // 添加点击事件
        addMoment.addTarget(self, action: #selector(addMomentTapped), for: .touchUpInside)
        
        // 将按钮放到视图的最上层
        view.bringSubviewToFront(addMoment)
    }
    
    // MARK: - 拖动手势处理
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        // 更新按钮的位置
        if let button = gesture.view {
            button.center = CGPoint(x: button.center.x + translation.x, y: button.center.y + translation.y)
            gesture.setTranslation(.zero, in: view) // 重置 translation
        }
        
        // 手势结束时，吸附到左右两侧
        if gesture.state == .ended {
            guard let button = gesture.view else { return }
            
            let buttonCenterX = button.center.x
            let screenWidth = view.bounds.width
            
            // 判断按钮靠近哪一侧并吸附
            let targetX: CGFloat
            if buttonCenterX < screenWidth / 2 {
                targetX = button.frame.width / 2 // 吸附到左边
            } else {
                targetX = screenWidth - button.frame.width / 2 // 吸附到右边
            }
            
            // 动画吸附效果并设置新位置
            UIView.animate(withDuration: 0.3) {
                button.center = CGPoint(x: targetX, y: button.center.y)
            }
        }
    }
    
    // MARK: - 点击 addMoment 按钮跳转页面
    @objc func addMomentTapped() {
        performSegue(withIdentifier: "toAddMoment", sender: nil) // 请确保 segue identifier 是 "showNextPage"
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "momentsTableViewCell", for: indexPath) as! momentsTableViewCell
        let moment = moments[indexPath.row]
        
        // 填充动态内容
        cell.uName.text = moment.userName
        cell.content.text = moment.contentText
        cell.location.text = moment.location
        cell.distance.text = moment.distance
        cell.timerun.text = moment.timeRun
        cell.challengetype.text = moment.challengeType
        cell.head.image = UIImage(named: moment.headImageName)
        cell.shareImage1.image = UIImage(named: moment.shareImage1Name)
        cell.shareImage2.image = UIImage(named: moment.shareImage2Name)
        
        // 设置点赞按钮的图标
        let likeIcon = moment.isLiked ? "hand.thumbsup.fill" : "hand.thumbsup"
        cell.likebottom.setImage(UIImage(systemName: likeIcon), for: .normal)
        
        // 为点赞按钮添加点击事件
        cell.likebottom.tag = indexPath.row
        cell.likebottom.addTarget(self, action: #selector(toggleLike(_:)), for: .touchUpInside)
        
        return cell
    }
    
    // MARK: - 点赞按钮功能
    @objc func toggleLike(_ sender: UIButton) {
        let index = sender.tag
        moments[index].isLiked.toggle()  // 切换点赞状态
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
    }
}
