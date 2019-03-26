//
//  FoodApiHandler.swift
//  commentDemo
//
//  Created by SHILEI CUI on 3/25/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Alamofire

let baseAPIUrl = "https://api.foursquare.com/v2/venues/search?near=Chicago&query=Food&client_id=DTE3Y54K0IZVOAH1TOP3A33OCZI40IGNB1VOHZQHMAF3Q21U&client_secret=5PDEOZOIFJR3001TMKAYMPTE4QDHHZ5OJKNMIFVYL0RB1QJC&v=20130815"

class APIHandler: NSObject {
    
    static var sharedInstance = APIHandler()
    
    
    func getAllFiles(completionHandler:@escaping (_ arr:Array<Venues>)->()){
        let urlString = String(format: baseAPIUrl)
        guard let pathUrl = URL(string: urlString) else {
            completionHandler([])
            return
        }
        
        var urlRequest = URLRequest(url: pathUrl)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        Alamofire.request(urlRequest).validate().responseJSON { (response) in
            let dict = response.result.value as? Dictionary<String, Any>

            let data = dict?["response"] as? Dictionary<String,Any>
                
            if let ven = data!["venues"] as? Array<Dictionary<String, Any>>{

                    let foodArray = ven.map({ (foodDict) -> Venues in
                        Venues(JSON: foodDict)!
                    })
                    
                completionHandler(foodArray)
                }
            
        }
    }
}

