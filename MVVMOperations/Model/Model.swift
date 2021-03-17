//
//  Model.swift
//  MVVMOperations
//
//  Created by Yakup Demir on 14.02.2021.
//

import Foundation
import ObjectMapper

class Model:NSObject,Mappable {
 
    var id:Int?
    var userId:Int?
    var title:String?
    var body:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        userId <- map["userId"]
        title <- map["title"]
        body <- map["body"]
    }
    
 
}
