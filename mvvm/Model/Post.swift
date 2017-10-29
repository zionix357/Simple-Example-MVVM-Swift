//
//  Post.swift
//  mvvm
//
//  Created by Arthur Rocha on 28/10/17.
//  Copyright © 2017 DatIn. All rights reserved.
//

import UIKit
import ObjectMapper

class Post : Mappable{
    
    var userId : Int?
    var id : Int?
    var title : String?
    var body : String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        userId  <- map["userId"]
        id      <- map["id"]
        title   <- map["title"]
        body    <- map["body"]
    }
}
