//
//  FourthViewController.swift
//  commentDemo
//
//  Created by SHILEI CUI on 3/25/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SVProgressHUD
import CoreLocation

class FourthViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate {

    @IBOutlet weak var tblView: UITableView!
    
    var json_arr : Array<Venues> = [] {
        didSet{
            DispatchQueue.main.async {
                self.tblView.reloadData()
                //update UI like table reloading
            }
        }
    }
    var locationManager = CLLocationManager()
    
    var custom : CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callMovieAPI()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json_arr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "foodCell") as? FoodTableViewCell
        
        let obj : Venues
        obj = json_arr[indexPath.row]
        cell?.lbl1.text = "\(obj.name!)"
        cell?.lbl2.text = "Address: \(obj.location?.address ?? "")"
        cell?.lbl3.text = "City: \(obj.location?.city ?? "")"
        cell?.lbl4.text = "Country: \(obj.location?.country ?? "")"
        
        custom = CLLocation.init(latitude: (obj.location?.lat)!, longitude: (obj.location?.lng)!)
        //obj.location?.lat
        
        return cell!
    }
    

    func callMovieAPI()  {
        SVProgressHUD.show()
        APIHandler.sharedInstance.getAllFiles() { (arr) in
            
            SVProgressHUD.dismiss()
            self.json_arr.append(contentsOf: arr)
        }
    }
    
    
    func setupLocation(){
        locationManager.requestWhenInUseAuthorization()
        //locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.last{
            
            getCityName(loc: custom!)
            // print(loc.coordinate)
            locationManager.stopUpdatingLocation()
        }
    }
    
//    var city : String?
//    //var location : CLLocation?
//    var address : String?
    func getCityName(loc:CLLocation) {
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(loc) { (placemarks, error) in
            if let place = placemarks?.last{
//                self.city = place.locality
//                //self.location = place.location
//                self.address = place.thoroughfare
                print(place.locality)
                print(place.location)
                print(place.thoroughfare)
                
            }
        }
    }
    
    

    @IBAction func getLocCellBtn(_ sender: UIButton) {
        setupLocation()
        
//        let alert = UIAlertController(title: "My Title", message: "City: \(city), address: \(address)", preferredStyle: UIAlertController.Style.alert)
//
//        // add an action (button)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//
//        // show the alert
//        self.present(alert, animated: true, completion: nil)
    }
}
