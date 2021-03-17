//
//  ModelService.swift
//  MVVMOperations
//
//  Created by Yakup Demir on 14.02.2021.
//

import Foundation
import Alamofire
class ModelService {
    static let instance = ModelService()
    
    func downloadData(completionHandler:@escaping([Model])->Void){
    
        AlamofireManager.instance.getData(url: Variables.getServiceUL) { (response:DataResponse<[Model]>) in
            
            let modelData = response.result.value
            
            if let data = modelData {
                completionHandler(data)
            }
        }
    }
    func postData(parameters:ModelParameters,completionHandler:@escaping(Model)->Void){
        
        AlamofireManager.instance.responseObject(url: Variables.serviceURL,  parameters: parameters.toDictionary()) { (repsonse:DataResponse<Model>) in
            
            let Modeldata = repsonse.result.value
            
            if let data = Modeldata {
                completionHandler(data)
            }
            
            debugPrint(repsonse)
        }
    }
}
