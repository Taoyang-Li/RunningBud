//
//  runHistoryDetail.swift
//  RunningBud
//
//  Created by chesterzhou on 11/8/24.
//

import UIKit
import MapKit

class runHistoryDetailtemp: UIViewController, MKMapViewDelegate {
    
 
    @IBOutlet weak var runPace: UILabel!
    @IBOutlet weak var runCal: UILabel!
    @IBOutlet weak var runDis: UILabel!
    @IBOutlet weak var runTime: UILabel!
    @IBOutlet weak var map: MKMapView!
    var runID: Int?
        let runData = runHistories() // 创建 runHistories 的实例

        override func viewDidLoad() {
            super.viewDidLoad()
            configureMap()
            loadRunHistory()
        }
        
        // 配置地图视图
        private func configureMap() {
            map.delegate = self
            map.mapType = .standard // 可以设置为 .hybrid 或 .satellite
            map.isZoomEnabled = true
            map.isScrollEnabled = true
        }
        
        // 加载并显示跑步历史数据
        private func loadRunHistory() {
            guard let runID = runID,
                  let runHistory = runData.runHis.first(where: { $0.runID == runID }) else { return }
            
            // 更新界面显示内容
            runPace.text = "\(runHistory.runSpace) min/km"
            runCal.text = "\(runHistory.runCal) kcal"
            runDis.text = "\(runHistory.runDis) km"
            runTime.text = runHistory.runTime
            
            // 设置地图并绘制路径
            setupMap(with: runHistory.runGPS)
        }
        
        // 设置地图显示和路径绘制
        private func setupMap(with coordinates: [[Double]]) {
            // 清除地图上的所有覆盖物和注释
            map.removeOverlays(map.overlays)
            map.removeAnnotations(map.annotations)

            let mapPoints = coordinates.map { CLLocationCoordinate2D(latitude: $0[0], longitude: $0[1]) }
            
            guard mapPoints.count > 1 else { return }

            // 创建多段线并添加到地图
            let polyline = MKPolyline(coordinates: mapPoints, count: mapPoints.count)
            map.addOverlay(polyline)
            
            // 设置地图显示区域为多段线的边界
            let region = MKCoordinateRegion(polyline.boundingMapRect)
            map.setRegion(map.regionThatFits(region), animated: true)
            
            // 打印所有定位点
            print("Run GPS Points:")
            mapPoints.forEach { point in
                print("Latitude: \(point.latitude), Longitude: \(point.longitude)")
            }
        }

        // MARK: - MKMapViewDelegate 方法
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 4.0
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    }
