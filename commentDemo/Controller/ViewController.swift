//
//  ViewController.swift
//  commentDemo
//
//  Created by mac on 3/21/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

import SVProgressHUD
import SDWebImage

let ClientID = "DTE3Y54K0IZVOAH1TOP3A33OCZI40IGNB1VOHZQHMAF3Q21U"
let ClientSecret = "5PDEOZOIFJR3001TMKAYMPTE4QDHHZ5OJKNMIFVYL0RB1QJC"
let FOURSQUARE_URL = "https://api.foursquare.com/v2/venues/search?near=%@&query=%@&client_id=%@&client_secret=%@&v=20130815"

import Alamofire

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    var json_arr : Array<Comment> = []
    
    var json_arr1 : Array<Country> = [] {
        didSet{
            DispatchQueue.main.async {
                self.tbleView.reloadData()
                //update UI like table reloading
            }
        }
    }
    
    @IBOutlet weak var tbleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getApiForComments()
        let utrStr = String(format: FOURSQUARE_URL, "Chicago", "Food", ClientID, ClientSecret)
        print(utrStr)
        getApiForCountries()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return json_arr.count
        return json_arr1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbleView.dequeueReusableCell(withIdentifier: "commentsTableViewCell", for: indexPath) as? commentsTableViewCell
        //let obj = json_arr[indexPath.row]
        let obj = json_arr1[indexPath.row]
        //print(obj)
        
        cell!.cellLbl?.text = "Name : \(obj.name!)"
        cell?.detailLbl.text = "Region: \(obj.region!)"
        cell?.curName.text = "Currency Name: \(obj.currencyName!)"
        cell?.curCode.text = "Currency Code: \(obj.currencyCode!)"
        cell?.curSymbol.text = "Currency Symbol: \(obj.currencySymbol!)"
        //print(obj.flagPng)
        
        
        // No need for Dispatch global async, can do it in one line
        let url = URL(string: obj.flagPng!)!
        cell!.imgView.sd_setImage(with: url, completed: nil)
        
//        DispatchQueue.global().async {
//            let url = URL(string: obj.flagPng!)
//            let data = try? Data(contentsOf: url!)
//            DispatchQueue.main.async {
//                cell?.imgView.image = UIImage(data: data!)
//            }
//            }
        
        
        return cell!
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //let obj = json_arr[indexPath.row]
//        let obj = json_arr1[indexPath.row]
//        let message = " Name : \(obj.name!) \n Region :\(obj.region!)"
//        let alert = UIAlertController(title: String(obj.currencyCode!), message: message, preferredStyle: .alert)
//
//        let action = UIAlertAction(title: "OK", style: .cancel, handler: {(action) in
//
//            })
//
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
//
//    }
    

//    func getApiForComments(){
//
//        Apihandler.sharedInstance.getApiForComments { (comments, error) in
//            if error == nil{
//                if let arr = comments{
//                    self.json_arr = arr
//                    DispatchQueue.main.async {
//                        self.tbleView.reloadData()
//                        //update UI like table reloading
//                    }
//                }
//            }
//        }
//    }
    
    func getApiForCountries(){

//      MBProgressHUD.showAdded(to: view, animated: true)
        SVProgressHUD.show()
        
    
        Apihandler.sharedInstance.getApiForCountries { (countries, error) in
            if error == nil{
                if let arr = countries{
                    self.json_arr1 = arr
                }
                DispatchQueue.main.sync {
                    //MBProgressHUD.hide(for: self.view, animated: true)
                    SVProgressHUD.dismiss()
                    self.tbleView.reloadData()
                    
                }
            }
        }
    }
    
   
}

