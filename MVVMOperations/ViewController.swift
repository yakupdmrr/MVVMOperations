//
//  ViewController.swift
//  MVVMOperations
//
//  Created by Yakup Demir on 14.02.2021.
//
 
import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var models = [Model]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
       
        downloadData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        print("name")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(downloadData), name: NSNotification.Name(rawValue: "newData"), object: nil)
    }
    
    @objc func addButtonClicked(){
        performSegue(withIdentifier: "toPostVC", sender: nil)
    }
    
   @objc func downloadData(){
        ModelService.instance.downloadData { (response) in
            self.models = response
            print(self.models.count)
            
            if let data = self.models as? [Model]{
                for i in data {
                    print("Title -> \(i.title ?? "Null Data")")
                }
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelList = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MVVMTableViewCell
        cell.titleLabel.text = modelList.title
        cell.bodyLabel.text = modelList.body
        return cell
    }
    


}

