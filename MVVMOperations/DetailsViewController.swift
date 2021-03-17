//
//  DetailsViewController.swift
//  MVVMOperations
//
//  Created by Yakup Demir on 14.02.2021.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var bodyText: UITextField!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var userIdText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    func posData(){
        var parameters = ModelParameters()
        
        parameters.userId = Int(userIdText.text ?? "0")
        parameters.body = bodyText.text
        parameters.title = titleText.text
        
        ModelService.instance.postData(parameters: parameters) { (response) in
            if response.body  != nil {
                print("Body -> \(response.body ?? "fdfsd")")
            }
            if response.title  != nil {
                print("Title -> \(response.title ?? "aaa")")
            }
        }
    }

    @IBAction func saveClicked(_ sender: Any) {
        posData()
    
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
