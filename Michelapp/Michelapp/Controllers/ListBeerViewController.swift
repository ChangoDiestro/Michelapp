//
//  ListBeerViewController.swift
//  Michelapp
//
//  Created by Gerardo Castillo on 20/10/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit
import Alamofire


class ListBeerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var jsonArray: NSArray?
    var nameArray: Array<String> = []
    var descriptionArray: Array<String> = []
    var priceArray: Array<String> = []
    var imageURLArray: Array<String> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        downloadDataFromAPI()
        
    }
    
    func downloadDataFromAPI(){
        Alamofire.request("https://private-64a7e-beerapi5.apiary-mock.com/beerList").responseJSON { response in
            if let JSON = response.result.value{
                self.jsonArray = JSON as? NSArray
                for item in self.jsonArray! as! [NSDictionary]{
                    let name = item["name"] as? String
                    let description = item["description"] as? String
                    let price = item["price"] as? String
                    let image = item["image"] as? String
                    
                    self.nameArray.append((name)!)
                    self.descriptionArray.append((description)!)
                    self.priceArray.append((price)!)
                    self.imageURLArray.append((image)!)
                    
                }
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return self.nameArray.count
        return self.nameArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellBeer", for: indexPath)
        
        
        cell.textLabel?.text = self.nameArray[indexPath.row]
        
        
        
        return cell
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
