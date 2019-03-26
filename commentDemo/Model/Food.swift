//
//  Food.swift
//  commentDemo
//
//  Created by SHILEI CUI on 3/25/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

struct Json4Swift_Base : Mappable {
    var response : Response?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        
        response <- map["response"]
    }
    
}

struct Response : Mappable {
    var venues : [Venues]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        
        venues <- map["venues"]
    }
    
}


struct Venues : Mappable {
    var id : String?
    var name : String?
    var location : Location?
    var verified : Bool?
    var referralId : String?
    var venueChains : [String]?
    var hasPerk : Bool?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        location <- map["location"]
        verified <- map["verified"]
        referralId <- map["referralId"]
        venueChains <- map["venueChains"]
        hasPerk <- map["hasPerk"]
    }
    
}

struct Location : Mappable {
    var address : String?
    var crossStreet : String?
    var lat : Double?
    var lng : Double?
    var postalCode : String?
    var cc : String?
    var city : String?
    var state : String?
    var country : String?
    var formattedAddress : [String]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        
        address <- map["address"]
        crossStreet <- map["crossStreet"]
        lat <- map["lat"]
        lng <- map["lng"]
        postalCode <- map["postalCode"]
        cc <- map["cc"]
        city <- map["city"]
        state <- map["state"]
        country <- map["country"]
        formattedAddress <- map["formattedAddress"]
    }
    
}
