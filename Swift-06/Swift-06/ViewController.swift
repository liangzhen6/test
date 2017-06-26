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
        self.mylocationBtn(UIButton())
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
    
        return UIStatusBarStyle.lightContent
        
    }
    
    @IBAction func mylocationBtn(_ sender: UIButton) {
        
        locationManger = CLLocationManager()
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManger.allowsBackgroundLocationUpdates = true
        locationManger.distanceFilter = 0.1
        locationManger.requestAlwaysAuthorization()
        locationManger.startUpdatingLocation()
        locationManger.startMonitoringSignificantLocationChanges()

        
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
//            locationManger.stopUpdatingLocation()

            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""

            let name = (containsPlacemark.name != nil) ? containsPlacemark.name : ""
            
            let subLocality = (containsPlacemark.subLocality != nil) ? containsPlacemark.subLocality : ""
            self.locationLabel.text = postalCode! + " " + locality!
            
            self.locationLabel.text?.append("\n" + administrativeArea! + ", " + country!)
//            let arr = placemark?.addressDictionary?["FormattedAddressLines"]
            
            let location = "\(locality!)\(subLocality!)\(name!)"
            let latitude =  containsPlacemark.location?.coordinate.latitude
            let longitude = containsPlacemark.location?.coordinate.longitude
            
            
            //http://weixinlz.applinzi.com/weixin?type=push&latitude=11.2&longitude=20.8&address=%E6%B7%B1%E5%9C%B3%E5%B8%82
            let myurl = "http://weixinlz.applinzi.com/weixin?type=push&latitude=\(latitude!)&longitude=\(longitude!)&address=\(location)"
            
            self.GET(myurl.addingPercentEncoding(withAllowedCharacters:  NSCharacterSet(charactersIn:"`#%^{}\"[]|\\<> ").inverted)!)//将字符串转化为utf-8
//            print("\(String(describing: placemark?.location?.coordinate.latitude))-----\(String(describing: placemark?.location?.coordinate.longitude)) ---\(location))")

            
        }

    
    }
    
    func GET(_ url:String) {
        
        let myUrl = URL.init(string: url)
//        let request = NSURLRequest.init(url: myUrl!)
//        var session = URLSession.init(configuration: URLSessionConfiguration.default)
        let mySession = URLSession.shared.dataTask(with: myUrl!) { (data, respon, error) in
            if error == nil {
                print("成功")
                var array:Any? = nil
                do {
                array = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions())
                print(array!)
                } catch {
                
                }
            
            }
            
        }
        
        mySession.resume()
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

