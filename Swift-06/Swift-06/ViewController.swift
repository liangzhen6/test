//
//  ViewController.swift
//  Swift-06
//
//  Created by shenzhenshihua on 2017/6/21.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManger: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
    
        return UIStatusBarStyle.lightContent
        
    }
    
    @IBAction func mylocationBtn(_ sender: UIButton) {
        
        locationManger = CLLocationManager()
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestAlwaysAuthorization()
        locationManger.startUpdatingLocation()

        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         self.locationLabel.text = "Error while updating location " + error.localizedDescription
        
        print(error.localizedDescription)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            
            if (error != nil) {
                self.locationLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0]
                self.displayLocationinfo(pm)
            } else {
                self.locationLabel.text = "Problem with the data received from geocoder"
            }

            
        }
    }
    
    
    func displayLocationinfo(_ placemark:CLPlacemark?) {
        if let containsPlacemark = placemark {
            locationManger.stopUpdatingLocation()

            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""

            self.locationLabel.text = postalCode! + " " + locality!
            
            self.locationLabel.text?.append("\n" + administrativeArea! + ", " + country!)

            
        }

        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

