//
//  Apihandler.swift
//  commentDemo
//
//  Created by Balu Naik on 3/21/19.
//  Copyright © 2019 mac. All rights reserved.
//

let urlString = "https://jsonplaceholder.typicode.com/comments"

let urlString1 = "https://countryapi.gear.host/v1/Country/getCountries"

import Foundation
import UIKit

class Apihandler: NSObject {
    static let  sharedInstance = Apihandler()
    private override init() {}
    
//    func getApiForComments(completion: @escaping (_ arrayComment: [Comment]?, _ error: Error?) -> Void){
//        let url = URL(string: urlString)
//        URLSession.shared.dataTask(with : url!){ (data, response, error) in
//            if error == nil{
//                do{
//                    if let jsonResult = try JSONSerialization.jsonObject(with : data!, options : []) as? [[String : Any]] {
//                       let arr = self.parseJson(jsonData: jsonResult)
//                       completion(arr,nil)
//                    }else{
//                       completion(nil,error)
//                    }
//                }
//                catch{
//                     completion(nil,error)
//                }
//            }
//            }.resume()
//    }
//
    func getApiForCountries(completion: @escaping (_ arrayComment: [Country]?, _ error: Error?) -> Void){
        let url = URL(string: urlString1)
        //print("ssas")
        URLSession.shared.dataTask(with : url!){ (data, response, error) in
            if error == nil{
                do{
                    if let jsonResult = try JSONSerialization.jsonObject(with : data!, options : []) as? [String : Any] {
                        let countryData = jsonResult["Response"] as! [[String : Any]]
                        let arr = self.parseJsonCountry(jsonData: countryData)
                        completion(arr,nil)
                    }else{
                        completion(nil,error)
                    }
                }
                catch{
                    completion(nil,error)
                }
            }
            }.resume()
    }
    
//    func parseJson(jsonData : [[String : Any]]) -> [Comment]{
//        var json_arr : Array<Comment> = []
//        for json in jsonData{
//            json_arr.append(Comment.init(id : json["postId"] as? Int, postId: json["id"] as? Int, name : json["name"] as? String, email : json["email"] as? String, body : json["body"] as? String))
//        }
//        return json_arr
//    }
    
    func parseJsonCountry(jsonData : [[String : Any]]) -> [Country]{
        var json_arr1 : Array<Country> = []
        for json in jsonData{
            json_arr1.append(Country.init(name : json["Name"] as? String, region: json["Region"] as? String, currencyCode : json["CurrencyCode"] as? String, currencyName : json["CurrencyName"] as? String, currencySymbol : json["CurrencySymbol"] as? String, flagPng : json["FlagPng"] as? String))
        }
        return json_arr1
    }
}
