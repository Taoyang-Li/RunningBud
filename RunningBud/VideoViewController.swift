//
//  VideoViewController.swift
//  RunningBud
//
//  Created by chesterzhou on 11/12/24.
//

//
//  VideoViewController.swift
//  RunningBud
//
//  Created by chesterzhou on 11/12/24.
//

import UIKit
import AVFoundation

class VideoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var videoName: String?
    var player: AVPlayer?
    private var tableView: UITableView!

    // Usernames and comments arrays
    var userNames: [String] = [
        "Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Hank", "Ivy", "Jack",
        "Kathy", "Leo", "Mona", "Nina", "Oliver", "Paul", "Quincy", "Rachel", "Sam", "Tina",
        "Uma", "Victor", "Wendy", "Xander", "Yara", "Zane", "Ben", "Clara", "Derek", "Ella",
        "Finn", "Gina", "Harry", "Isla", "Jake", "Luna", "Mia", "Noah", "Oscar", "Piper",
        "Quinn", "Ruby", "Sophia", "Theo", "Vera", "Will", "Xenia", "Yvonne", "Zack", "Daisy"
    ]

    var comments: [String] = [
        "Nice!", "Great job!", "Awesome!", "Well done!", "Loved it!", "Cool!", "Good one!", "Fantastic!",
        "Nice work!", "Amazing!", "Perfect!", "Interesting!", "Good vibes!", "Incredible!", "Great stream!",
        "Superb!", "Fun!", "Loved this!", "Very cool!", "Brilliant!", "Excellent!", "Fantastic job!", "Thanks!",
        "Wonderful!", "Top notch!", "Keep going!", "Really fun!", "Super!", "Great energy!", "Loved this!",
        "Too good!", "Very nice!", "Entertaining!", "So good!", "Amazing work!", "Cheers!", "Hilarious!",
        "Great edit!", "Outstanding!", "Very funny!", "Legend!", "Very helpful!", "Superb quality!", "Classic!",
        "Great info!", "Super entertaining!", "Can't wait!", "Lovely!", "Enjoyed this!", "Thanks a lot!"
    ]

    // Displayed usernames and comments
    var displayedUserNames: [String] = []
    var displayedComments: [String] = []

    private var scrollTimer: Timer?
    private var currentRowIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // 隐藏导航栏
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        // 随机选择15个用户名和评论
        selectRandomComments()

        guard let videoName = videoName, let videoPath = Bundle.main.path(forResource: videoName, ofType: nil) else {
               print("Failed to load video file.")
               return
           }
           print("Video file loaded: \(videoName)")

           let videoURL = URL(fileURLWithPath: videoPath)
           player = AVPlayer(url: videoURL)
           player?.volume = 0 // 静音播放
           let playerLayer = AVPlayerLayer(player: player)

           playerLayer.frame = view.bounds
           playerLayer.videoGravity = .resizeAspectFill
           view.layer.addSublayer(playerLayer)

           // 添加观察者，监听视频播放结束通知
           NotificationCenter.default.addObserver(
               self,
               selector: #selector(loopVideo),
               name: .AVPlayerItemDidPlayToEndTime,
               object: player?.currentItem
           )

           // 播放视频
           player?.play()


        // 添加左上角的用户信息
        let imageSize = CGSize(width: 30, height: 30) // 图片大小
        let imagePosition = CGPoint(x: 30, y: 50)    // 图片位置
        let labelOffset = CGPoint(x: 5, y:0)       // 标签偏移量
            
        addUserInfoToTopLeft(imageSize: imageSize, imagePosition: imagePosition, labelOffset: labelOffset)

        // 添加标签和按钮
        addLabelsAndButtons()

        // 设置表视图
        setupTableView()

        // 开始滚动计时器
        startScrollingTimer()
    }
    
    private func addUserInfoToTopLeft(imageSize: CGSize, imagePosition: CGPoint, labelOffset: CGPoint) {
        // 从 DataStore 中随机选择一个用户
        guard let randomUser = users().uUsers.randomElement() else { return }

        // 创建圆形图片视图
        let imageView = UIImageView()
        imageView.image = UIImage(named: randomUser.headImage) // 假设 headImage 是资源名
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageSize.width / 2 // 圆形大小为 width/2
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(origin: imagePosition, size: imageSize)
        view.addSubview(imageView)

        // 创建标签
        let nameLabel = UILabel()
        nameLabel.text = randomUser.uName
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        nameLabel.sizeToFit()
        nameLabel.frame = CGRect(
            x: imageView.frame.maxX + labelOffset.x,
            y: imageView.frame.midY - nameLabel.frame.height / 2 + labelOffset.y,
            width: nameLabel.frame.width,
            height: nameLabel.frame.height
        )
        view.addSubview(nameLabel)
    }

    @objc private func loopVideo() {
        player?.seek(to: .zero) // 将播放时间调整到视频开头
        player?.play()          // 重新播放视频
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        player?.pause()
        stopScrollingTimer()

        // 移除通知观察者
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
    }

    private func setupTableView() {
        tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 608, width: 240, height: 170)
        tableView.layer.cornerRadius = 10
        tableView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }

    private func addLabelsAndButtons() {
        // Live streaming label
        let textLabel = UILabel()
        textLabel.text = "Live Stream"
        textLabel.textColor = .white
        textLabel.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        ])
        
        // Adding system icons
        let heartIcon = createIconImageView(named: "heart", position: CGPoint(x: 338, y: 608))
        let textBubbleIcon = createIconImageView(named: "text.bubble", position: CGPoint(x: 338, y: 658))
        let starIcon = createIconImageView(named: "star", position: CGPoint(x: 338, y: 708))
        let paperplaneIcon = createIconImageView(named: "paperplane", position: CGPoint(x: 338, y: 758))
        
        view.addSubview(heartIcon)
        view.addSubview(textBubbleIcon)
        view.addSubview(starIcon)
        view.addSubview(paperplaneIcon)

        // Add open camera button
        let cameraButton = UIButton(type: .system)
        cameraButton.setTitle("Your Channel", for: .normal)
        cameraButton.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        cameraButton.tintColor = .white
        cameraButton.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        cameraButton.frame = CGRect(x: 240, y: 80, width: 150, height: 50)
        cameraButton.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        view.addSubview(cameraButton)
        cameraButton.layer.cornerRadius = cameraButton.frame.height / 2
    }

    private func createIconImageView(named iconName: String, position: CGPoint) -> UIImageView {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: iconName)
        iconImageView.tintColor = .white
        iconImageView.isUserInteractionEnabled = true
        iconImageView.frame = CGRect(x: position.x, y: position.y, width: 30, height: 30)

        if iconName == "heart" || iconName == "star" {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(iconTapped(_:)))
            iconImageView.addGestureRecognizer(tapGesture)
        }
        return iconImageView
    }

    @objc private func iconTapped(_ sender: UITapGestureRecognizer) {
        guard let tappedIcon = sender.view as? UIImageView else { return }

        if tappedIcon.image == UIImage(systemName: "heart") {
            tappedIcon.image = UIImage(systemName: "heart.fill")
            tappedIcon.tintColor = .red
        } else if tappedIcon.image == UIImage(systemName: "heart.fill") {
            tappedIcon.image = UIImage(systemName: "heart")
            tappedIcon.tintColor = .white
        } else if tappedIcon.image == UIImage(systemName: "star") {
            tappedIcon.image = UIImage(systemName: "star.fill")
            tappedIcon.tintColor = .yellow
        } else if tappedIcon.image == UIImage(systemName: "star.fill") {
            tappedIcon.image = UIImage(systemName: "star")
            tappedIcon.tintColor = .white
        }
    }

    @objc private func openCamera() {
        let cameraVC = CameraViewController()
        let navController = UINavigationController(rootViewController: cameraVC)
        self.present(navController, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedUserNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }

        let userNameLabel = UILabel()
        userNameLabel.text = displayedUserNames[indexPath.row]
        userNameLabel.textColor = .purple
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        userNameLabel.frame = CGRect(x: 10, y: 5, width: 60, height: 15)

        let commentLabel = UILabel()
        commentLabel.text = displayedComments[indexPath.row]
        commentLabel.textColor = .white
        commentLabel.font = UIFont.systemFont(ofSize: 14)
        commentLabel.frame = CGRect(x: 66, y: 5, width: tableView.frame.width - 10, height: 15)

        cell.contentView.addSubview(userNameLabel)
        cell.contentView.addSubview(commentLabel)
        cell.backgroundColor = .clear

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }

    private func startScrollingTimer() {
        scrollTimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(scrollTableView), userInfo: nil, repeats: true)
    }

    private func stopScrollingTimer() {
        scrollTimer?.invalidate()
        scrollTimer = nil
    }

    @objc private func scrollTableView() {
        guard !displayedUserNames.isEmpty else { return }
        currentRowIndex += 1
        if currentRowIndex >= displayedUserNames.count {
            currentRowIndex = 0
        }
        let indexPath = IndexPath(row: currentRowIndex, section: 0)
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
    }

    private func selectRandomComments() {
        displayedUserNames.removeAll()
        displayedComments.removeAll()
        let randomIndexes = Array(0..<userNames.count).shuffled().prefix(25)
        for index in randomIndexes {
            displayedUserNames.append(userNames[index])
            displayedComments.append(comments[index])
        }
    }
}
