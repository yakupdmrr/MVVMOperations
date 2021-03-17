//
//  ModelParameters.swift
//  MVVMOperations
//
//  Created by Yakup Demir on 14.02.2021.
//

import Foundation

struct ModelParameters:Codable {
    var id:Int?
    var userId:Int?
    var title:String?
    var body:String?
    
    
    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()
        
        if userId != nil {
            dictionary["userId"] = userId
        }
        if title != nil {
            dictionary["title"] = title
        }
        if body != nil {
            dictionary["body"] = body
        }
        
        return dictionary
    }
}

