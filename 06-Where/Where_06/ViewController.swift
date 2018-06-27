//
//  ViewController.swift
//  Where_06
//
//  Created by 宋澎 on 2018/6/6.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate{

    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    }
    
    //只读属性的简写
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func clickFindMyLocationButton(_ sender: Any) {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        self.locationLabel.text = "定位失败"
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            if error != nil{
                self.locationLabel.text = "定位错误 error = " + error!.localizedDescription
                return
            }
            
            if (placemarks?.count)! > 0 {
                let firstItem = placemarks?.first
                self.displayLocationInfo(firstItem)
            }else{
                self.locationLabel.text = "数据接收异常"
            }
        }
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark?){
        
        if let containPlace = placemark {
            
            locationManager.stopUpdatingLocation()
            
            let area = containPlace.subLocality ?? "未知地区 "
            
            let street = containPlace.name ?? "未知街道 "
            
            let country = containPlace.country ?? "未知国家 "
            
            let city = containPlace.locality ?? "未知城市 "
            
            self.locationLabel.text = country + " " + city + " " + area + " " + street
        }
    }
    
}

