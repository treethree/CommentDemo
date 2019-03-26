//
//  ThirdViewController.swift
//  commentDemo
//
//  Created by SHILEI CUI on 3/25/19.
//  Copyright © 2019 mac. All rights reserved.
//



import UIKit
import TWMessageBarManager

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        TWMessageBarManager.sharedInstance().s
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        //TWMessageBarMessageType.success

        TWMessageBarManager.sharedInstance().showMessage(withTitle: "Success", description: "Your account was successfully updated", type: TWMessageBarMessageType.success)
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        TWMessageBarManager.sharedInstance().showMessage(withTitle: "Infooo", description: "Infoooooo", type: TWMessageBarMessageType.info)
    }
    @IBAction func btn3(_ sender: UIButton) {
        TWMessageBarManager.sharedInstance().showMessage(withTitle: "Error", description: "Error", type: TWMessageBarMessageType.error)
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
