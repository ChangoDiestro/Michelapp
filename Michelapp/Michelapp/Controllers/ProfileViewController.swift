//
//  ProfileViewController.swift
//  Michelapp
//
//  Created by Jesús Tirado on 10/26/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    var consumptionArray: Array<String>  = [] 
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
       consumptionArray = UserDefaults.standard.array(forKey: "consumptionArray") as! Array<String>
    }
    
    override func viewDidAppear(_ animated: Bool) {
        consumptionArray = UserDefaults.standard.array(forKey: "consumptionArray") as! Array<String>
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return consumptionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custumerCell", for: indexPath)
        
        cell.textLabel?.text = consumptionArray[indexPath.row]
        return cell
        
    }
 

}
