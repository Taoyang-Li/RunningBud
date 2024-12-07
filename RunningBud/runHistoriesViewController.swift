//
//  runHistoriesViewController.swift
//  RunningBud
//
//  Created by chesterzhou on 11/8/24.
//

import UIKit

class runHistoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dispalyUserserImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var displayUserLevel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var runHistoriesData = runHistories() // 实例化数据源
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
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
        
        // MARK: - Table View Data Source Methods
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return runHistoriesData.runHis.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "runHistoriesTableViewCell", for: indexPath) as? runHistoriesTableViewCell else {
                return UITableViewCell()
            }
            
            let runHistory = runHistoriesData.runHis[indexPath.row]
            
            // 设置各个 UILabel 和 UIImageView
            cell.runSpace.text = "\(runHistory.runSpace) min/mile"
            cell.runCal.text = "\(runHistory.runCal) kcal"
            
            // 日期格式化器，用于显示年月日
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            cell.runDate.text = dateFormatter.string(from: runHistory.runDate)
            
            cell.runDis.text = "\(runHistory.runDis) mile"
            cell.runImage.image = UIImage(named: runHistory.runImage)
            
            return cell
        }
        
        // MARK: - Prepare for Segue
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showRunHistoryDetail",
               let destinationVC = segue.destination as? runHistoryDetail,
               let indexPath = tableView.indexPathForSelectedRow {
                let selectedRunHistory = runHistoriesData.runHis[indexPath.row]
                destinationVC.runID = selectedRunHistory.runID
            }
        }
    }
