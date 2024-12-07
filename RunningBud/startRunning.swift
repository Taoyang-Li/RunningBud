//
//  startRunning.swift
//  RunningBud
//
//  Created by chesterzhou on 9/26/24.
//

import UIKit
import MapKit
import CoreLocation

class startRunning: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!  // 显示地图
    @IBOutlet weak var timerLabel: UILabel!  // 显示秒表时间的 Label
    @IBOutlet weak var startButton: UIButton!  // 开始秒表的按钮
    @IBOutlet weak var stopButton: UIButton!  // 停止秒表的按钮
    
    var timer: Timer?  // 计时器
    var startTime: TimeInterval = 0  // 记录开始时间
    var elapsedTime: TimeInterval = 0  // 已经计时的时间
    var isRunning = false  // 判断计时器是否正在运行
    
    let locationManager = CLLocationManager()  // 用于定位管理
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化秒表UI
        timerLabel.text = "00:00:00.000"
        stopButton.isEnabled = false  // 初始时禁用停止按钮
        
        // 初始化地图设置
        mapView.mapType = .standard
        
        // 配置位置管理器
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()  // 请求用户授权使用定位服务
        
        // 显示 National Mall 位置
        centerMapOnNationalMall()
    }
    
    // MARK: - 秒表功能
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if !isRunning {
            print("Timer started")
            startButton.isEnabled = false
            stopButton.isEnabled = true
            isRunning = true
            
            // 记录开始时间
            startTime = Date().timeIntervalSinceReferenceDate - elapsedTime
            
            // 开始计时器，每 0.01 秒更新一次
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                
                let currentTime = Date().timeIntervalSinceReferenceDate
                self.elapsedTime = currentTime - self.startTime
                self.updateTimerLabel()
            }
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        if isRunning {
            timer?.invalidate()
            timer = nil
            print("Timer stopped")
            stopButton.isEnabled = false
            startButton.isEnabled = true
            isRunning = false
        }
    }
    
    func updateTimerLabel() {
        let hours = Int(elapsedTime) / 3600
        let minutes = Int(elapsedTime) / 60 % 60
        let seconds = Int(elapsedTime) % 60
        let milliseconds = Int((elapsedTime - Double(Int(elapsedTime))) * 1000)
        
        // 更新 label 显示时、分、秒和毫秒
        timerLabel.text = String(format: "%02d:%02d:%02d.%03d", hours, minutes, seconds, milliseconds)
    }
    
    //地图功能
    
    func centerMapOnNationalMall() {
        // National Mall 的经纬度坐标
        let nationalMallCoordinates = CLLocationCoordinate2D(latitude: 38.8893, longitude: -77.0502)
        
        // 定义一个区域的跨度（范围），以便地图显示适当的缩放比例
        let regionSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: nationalMallCoordinates, span: regionSpan)
        
        // 设置地图的显示区域
        mapView.setRegion(region, animated: true)
        
        // 添加一个标注（pin）来标记 National Mall 的位置
        let annotation = MKPointAnnotation()
        annotation.coordinate = nationalMallCoordinates
        annotation.title = "National Mall"
        annotation.subtitle = "Washington, D.C."
        mapView.addAnnotation(annotation)
    }
    
    // CLLocationManagerDelegate: 当用户授权或拒绝定位服务时调用
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()  // 开始更新用户位置
        } else {
            print("Location access denied.")
        }
    }
}
