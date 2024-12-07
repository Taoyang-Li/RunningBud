//  VideoPageViewController.swift
//  testTableview
//
//  Created by chesterzhou on 11/12/24.
//


import UIKit
import AVFoundation

class VideoPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    let videos = ["video1.mp4", "video2.mp4", "video3.mp4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置数据源
        dataSource = self
        
        // 设置初始页面为第一个视频
        if let firstViewController = viewControllerForVideo(at: 0) {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    // 创建并返回指定视频的 VideoViewController 实例
    func viewControllerForVideo(at index: Int) -> VideoViewController? {
        guard index >= 0 && index < videos.count else { return nil }
        
        let videoVC = VideoViewController()
        videoVC.videoName = videos[index]
        videoVC.player?.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd(notification:)), name: .AVPlayerItemDidPlayToEndTime, object: videoVC.player?.currentItem)
        return videoVC
    }
    
    @objc func videoDidEnd(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: .zero, completionHandler: nil)
        }
    }

    // MARK: - UIPageViewControllerDataSource
    
    // 返回前一个视频控制器
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let videoVC = viewController as? VideoViewController, let videoName = videoVC.videoName, let index = videos.firstIndex(of: videoName) else {
            return nil
        }
        let previousIndex = (index - 1 + videos.count) % videos.count
        return viewControllerForVideo(at: previousIndex)
    }
    
    // 返回下一个视频控制器
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let videoVC = viewController as? VideoViewController, let videoName = videoVC.videoName, let index = videos.firstIndex(of: videoName) else {
            return nil
        }
        let nextIndex = (index + 1) % videos.count
        return viewControllerForVideo(at: nextIndex)
    }
}

