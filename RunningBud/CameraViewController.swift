//
//  CameraViewController.swift
//  RunningBud
//
//  Created by chesterzhou on 11/15/24.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    var captureSession: AVCaptureSession!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    var cameraErrorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        // 配置自定义导航栏
        setupCustomNavigationBar()

        // 配置摄像头
        setupCamera()

        // 添加顶部标签
        setupTopLabel()

        // 添加 Table View
        setupTableView()
    }

    // 自定义导航栏，仅保留返回按钮
    private func setupCustomNavigationBar() {
        // 设置返回按钮
        let backButton = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(backToPrevious)
        )
        backButton.tintColor = .white
        navigationItem.leftBarButtonItem = backButton

        // 隐藏导航栏的背景
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
    }

    @objc private func backToPrevious() {
        self.dismiss(animated: true, completion: nil)
    }
    // 设置摄像头
    private func setupCamera() {
        captureSession = AVCaptureSession()
            captureSession.sessionPreset = .high

            guard let backCamera = AVCaptureDevice.default(for: .video) else {
                showCameraError(message: "Unable to access the camera")
                return
            }

            do {
                let input = try AVCaptureDeviceInput(device: backCamera)

                if captureSession.isRunning {
                    captureSession.stopRunning()
                }
                captureSession.addInput(input)

                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                videoPreviewLayer.videoGravity = .resizeAspectFill
                videoPreviewLayer.frame = view.bounds
                view.layer.insertSublayer(videoPreviewLayer, at: 0)

                captureSession.startRunning()
            } catch {
                showCameraError(message: "Camera setup failed: \(error.localizedDescription)")
            }
    }

    // 显示摄像头错误提示
    private func showCameraError(message: String) {
        cameraErrorLabel = UILabel()
        cameraErrorLabel.text = message
        cameraErrorLabel.textColor = .red
        cameraErrorLabel.font = UIFont.boldSystemFont(ofSize: 18)
        cameraErrorLabel.textAlignment = .center
        cameraErrorLabel.numberOfLines = 0
        cameraErrorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cameraErrorLabel)

        NSLayoutConstraint.activate([
            cameraErrorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cameraErrorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cameraErrorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cameraErrorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    // 设置顶部标签
    private func setupTopLabel() {
        let topLabel = UILabel()
        topLabel.text = "Your Channel"
        topLabel.textColor = .white
        topLabel.font = UIFont.boldSystemFont(ofSize: 24)
        topLabel.textAlignment = .center
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topLabel)

        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    // 设置 Table View
    private func setupTableView() {
        tableView = UITableView()
        tableView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        tableView.layer.cornerRadius = 10
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 170),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    // UITableView DataSource 和 Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "No Comments now"
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
