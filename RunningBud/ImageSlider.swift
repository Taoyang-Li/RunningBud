import UIKit

class ImageSlider: UIView, UIScrollViewDelegate {
    private var scrollView: UIScrollView!
    private var scrollTimer: Timer?
    private var isAnimatingBackToFirst = false
    var imageNames: [String] = []
    var scrollInterval: TimeInterval = 3.0  // 滚动间隔时间，可调整

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupScrollView()
    }
    
    private func setupScrollView() {
        scrollView = UIScrollView(frame: self.bounds)
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.clipsToBounds = true
        self.addSubview(scrollView)
    }
    
    func configure(with imageNames: [String], scrollInterval: TimeInterval) {
        self.imageNames = imageNames
        self.scrollInterval = scrollInterval
        setupImageContainers()
        startTimer()
    }
    
    private func setupImageContainers() {
        let screenWidth = self.bounds.width
        let screenHeight = self.bounds.height
        scrollView.contentSize = CGSize(width: screenWidth * CGFloat(imageNames.count), height: screenHeight)
        
        for (index, imageName) in imageNames.enumerated() {
            // 创建并设置容器视图的位置
            let containerView = UIView(frame: CGRect(x: CGFloat(index) * screenWidth, y: 0, width: screenWidth, height: screenHeight))
            containerView.clipsToBounds = true
            scrollView.addSubview(containerView)
            
            // 创建 imageView 并添加到容器视图中
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = .scaleAspectFit
            containerView.addSubview(imageView)
            
            // 设置 imageView 的约束，使其在 containerView 中保持4:3比例并居中显示
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 4.0/3.0), // 设置4:3比例
                imageView.widthAnchor.constraint(lessThanOrEqualTo: containerView.widthAnchor),
                imageView.heightAnchor.constraint(lessThanOrEqualTo: containerView.heightAnchor)
            ])
        }
    }

    private func startTimer() {
        scrollTimer = Timer.scheduledTimer(timeInterval: scrollInterval, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }
    
    private func stopTimer() {
        scrollTimer?.invalidate()
        scrollTimer = nil
    }
    
    @objc private func autoScroll() {
        let pageWidth = scrollView.frame.width
        let maxWidth = pageWidth * CGFloat(imageNames.count)
        let contentOffset = scrollView.contentOffset.x
        
        if isAnimatingBackToFirst {
            return
        }
        
        var slideToX = contentOffset + pageWidth
        if contentOffset + pageWidth >= maxWidth {
            slideToX = 0
            isAnimatingBackToFirst = true
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.isAnimatingBackToFirst = false
                self.autoScroll()
            }
        } else {
            scrollView.setContentOffset(CGPoint(x: slideToX, y: 0), animated: true)
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        stopTimer()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        startTimer()
        
        // 确保 contentOffset 处于正确的位置
        let pageWidth = scrollView.frame.width
        let currentPage = Int(scrollView.contentOffset.x / pageWidth)
        scrollView.setContentOffset(CGPoint(x: CGFloat(currentPage) * pageWidth, y: 0), animated: false)
    }
    
    deinit {
        stopTimer()
    }
}

