//
//  AlamofireManager.swift
//  MVVMOperations
//
//  Created by Yakup Demir on 14.02.2021.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class AlamofireManager{
    static let instance = AlamofireManager()
  
    // MARK:ALAMOFİRE GET
    func getData<T>(url:URLConvertible,method:HTTPMethod=HTTPMethod.get,parameters:Parameters?=nil,completionHandler:@escaping(DataResponse<[T]>)->Void) where T:Mappable {
    	
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseArray(completionHandler: {(response:DataResponse<[T]>) -> Void in
        
            if response.result.isSuccess {
                completionHandler(response)
            }
            if response.result.isFailure {
                print("Error -> \(String(describing: response.error))")
            }
        
        })
        
    }
    
    // MARK: ALAMOFİRE POST
    func responseObject<T>(url:URLConvertible,method:HTTPMethod=HTTPMethod.post,parameters:Parameters?=nil,encoding:ParameterEncoding = JSONEncoding.default,keyPath:String?=nil,completionHandler:@escaping(DataResponse<T>)->Void) where T:Mappable {
        let headers:HTTPHeaders = ["Content-type":"application/json; charset=UTF-8"]
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseObject(completionHandler: {(response:DataResponse<T>) -> Void in
            if response.result.isSuccess {
                completionHandler(response)
            }
            if response.result.isFailure {
                print("Error -> \(String(describing: response.error))")
            }
            
        })
        
    }
    
    
}
