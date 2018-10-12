//
//  ConsumerViewController.swift
//  Michelapp
//
//  Created by Abraham Quezada on 10/10/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit
import CoreLocation

class ConsumerViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        //view.backgroundColor = UIColor.gray
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    // do stuff
                }
            }
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
