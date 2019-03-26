//
//  FourthViewController.swift
//  commentDemo
//
//  Created by SHILEI CUI on 3/25/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SVProgressHUD
class FourthViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var tblView: UITableView!
    
    var json_arr : Array<Venues> = [] {
        didSet{
            DispatchQueue.main.async {
                self.tblView.reloadData()
                //update UI like table reloading
            }
        }
    }
    
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
        
        return cell!
    }
    

    func callMovieAPI()  {
        SVProgressHUD.show()
        APIHandler.sharedInstance.getAllFiles() { (arr) in
            
            SVProgressHUD.dismiss()
            self.json_arr.append(contentsOf: arr)
        }
    }

}
