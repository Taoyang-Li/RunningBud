//
//  homePage.swift
//  RunningBud
//
//  Created by chesterzhou on 9/18/24.
//

import UIKit

class homePage: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var welcomeMessage: UILabel!
    
    
    @IBOutlet weak var deviceButton: UIButton!
    
    @IBOutlet weak var jGroups: UITableView!
    @IBOutlet weak var displayUserLevel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var filteredChallenges: [challenge] = []
        let challenges = cChallenges() // 创建一个cChallenges实例
        var imageNames: [String] = ["ads1", "ads2", "ads3", "ads4", "ads5","ads6","ads7"]
        var scrollTimer: Timer?
        var isAnimatingBackToFirst = false // 标记是否正在返回第一个页面

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // 设置欢迎消息
            welcomeMessage.text = "Welcome \(userName)"
            
            // 根据userLevel设置显示的级别
            switch userLevel {
            case 1:
                self.displayUserLevel.text = "Beginner"
            case 2:
                self.displayUserLevel.text = "Intermediate"
            case 3:
                self.displayUserLevel.text = "Advanced"
            case 4:
                self.displayUserLevel.text = "Elite"
            default:
                self.displayUserLevel.text = "Unknown Level"
            }

            // 设置TableView的数据源和委托
            jGroups.delegate = self
            jGroups.dataSource = self
            
            // 筛选出与joinedGroup匹配的挑战
            filterChallenges()
            
            // 设置 scrollView 内容
            if !paiedUser {
                setupScrollView() // 仅在 scrollView 显示时设置内容
                startTimer()       // 启动自动滑动
            }
        }

        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            // 根据 paiedUser 控制 scrollView 可见性和 jGroups 位置
            if paiedUser {
                scrollView.isHidden = true
                jGroups.frame = CGRect(x: 0, y: 500, width: 393, height: 280)
                welcomeMessage.textColor = UIColor.systemYellow
            } else {
                scrollView.isHidden = false
            }
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationItem.hidesBackButton = true
            filteredChallenges.removeAll()  // 清空之前的数据
            filterChallenges()  // 重新筛选挑战
            jGroups.reloadData()  // 刷新表格视图
            
            welcomeMessage.text = "Welcome \(userName)"
            
            // 根据 paiedUser 状态设置用户名颜色
            if paiedUser {
                welcomeMessage.textColor = .systemYellow // 金色
            } else {
                welcomeMessage.textColor = .label // 默认颜色
            }
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            // 页面即将消失时，停止定时器并清空 scrollView 内容
            stopTimer()
        }
        
        // 设置 ScrollView 以显示多张图片
        func setupScrollView() {
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight: CGFloat = scrollView.frame.height
            
            // 重新计算 contentSize
            scrollView.contentSize = CGSize(width: screenWidth * CGFloat(imageNames.count), height: screenHeight)
            scrollView.delegate = self  // 设置 UIScrollView 的代理
            
            for (index, imageName) in imageNames.enumerated() {
                let imageView = UIImageView(frame: CGRect(x: CGFloat(index) * screenWidth, y: 0, width: screenWidth, height: screenHeight))
                imageView.image = UIImage(named: imageName) // 从Assets中加载图片
                imageView.contentMode = .scaleAspectFill // 设置图片填充模式
                imageView.clipsToBounds = true
                
                // 将 imageView 添加到 scrollView
                scrollView.addSubview(imageView)
            }
        }

        // 启动 Timer 方法，确保滑动速度恒定
        func startTimer() {
            scrollTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
        }

        // 停止 Timer 方法
        func stopTimer() {
            scrollTimer?.invalidate()
            scrollTimer = nil
        }

        // 自动滚动方法
        @objc func autoScroll() {
            let pageWidth = scrollView.frame.width
            let maxWidth = pageWidth * CGFloat(imageNames.count) // 根据图片数量设置滚动范围
            let contentOffset = scrollView.contentOffset.x
            
            if isAnimatingBackToFirst {
                return
            }
            
            var slideToX = contentOffset + pageWidth
            
            if contentOffset + pageWidth >= maxWidth {
                // 回到第一页，无动画
                slideToX = 0
                isAnimatingBackToFirst = true
                scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.isAnimatingBackToFirst = false
                    self.autoScroll()  // 手动触发一次自动滑动
                }
            } else {
                scrollView.setContentOffset(CGPoint(x: slideToX, y: 0), animated: true)
            }
            
            // 打印当前图片信息
            let currentPage = Int(slideToX / pageWidth)
            printImageInfo(at: currentPage)
        }

        // 当用户开始手动滑动时，停止 Timer
        func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            stopTimer()
        }

        // 当用户手动滑动结束时，重新启动 Timer
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            startTimer()
            
            // 获取当前展示的页面索引
            let pageWidth = scrollView.frame.width
            let currentPage = Int(scrollView.contentOffset.x / pageWidth)
            printImageInfo(at: currentPage)
        }

        // 打印当前展示的图片名称
        func printImageInfo(at index: Int) {
            if index < imageNames.count {
                print("Current Image: \(imageNames[index])")
            }
        }

        @IBAction func unwindToHomePage(segue: UIStoryboardSegue) {
            // 检查是否从 deviceSelect 返回
            if let sourceVC = segue.source as? deviceSelect {
                if let selectedButton = sourceVC.selectedButton {
                    deviceButton.setTitle(selectedButton, for: .normal)
                }
            }
        }

        func filterChallenges() {
            for groupID in joinedGroup {
                if let groupIDInt = Int(groupID) {
                    for challenge in challenges.couChals {
                        if challenge.cID == groupIDInt {
                            filteredChallenges.append(challenge)
                        }
                    }
                }
            }
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredChallenges.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cGroupJoinedTableViewCell", for: indexPath) as! cGroupJoinedTableViewCell
            
            let challenge = filteredChallenges[indexPath.row]
            cell.IDlabel.text = "Group ID: \(challenge.cID)"
            cell.Dislabel.text = "Target Distance: \(challenge.cDistance) miles"
            cell.Frelabel.text = "Fre: \(challenge.cFrequence)"
            cell.Acqlabel.text = "Acq: \(challenge.cAcquire)"
            cell.Typlabel.text = "Type: \(challenge.cType)"
            
            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showGroupDetails", sender: self)
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showGroupDetails" {
                if let destinationVC = segue.destination as? GroupDetailsViewController {
                    if let indexPath = jGroups.indexPathForSelectedRow {
                        let selectedChallenge = filteredChallenges[indexPath.row]
                        destinationVC.groupID = selectedChallenge.cID // 传递groupID
                    }
                }
            }
        }
    }
