//
//  ListBeerViewController.swift
//  Michelapp
//
//  Created by Gerardo Castillo on 20/10/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

var nameArray: Array<String> = []
var descriptionArray: Array<String> = []
var priceArray: Array<String> = []
var imageURLArray: Array<String> = []
var myIndex = 0
class ListBeerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var jsonArray: NSArray?
    var favoriteBeerArray: Array<String> = []
    var consumptionArray: Array<String> = []
    
    
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
                    
                    
                    nameArray.append((name)!)
                    descriptionArray.append((description)!)
                    priceArray.append((price)!)
                    imageURLArray.append((image)!)
                    
                }
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "sugueCustomer", sender: self)
    }
    
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier = "sugueCustomer", let nextScene = segue.destination as DesccriptionViewController, let indexPath = self.tableView.indexPathForSelectedRow{
            
        }
    } */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return self.nameArray.count
        return nameArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellBeer", for: indexPath)
        //let url = URL(string: self.imageURLArray[indexPath.row])

        //cell.imageView?.af_setImage(withURL: url!)
        
        let url = URL(string: imageURLArray[indexPath.row])
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                cell.imageView?.image = UIImage(data: data!)
            }
        }
        
        cell.textLabel?.text = nameArray[indexPath.row]
        cell.detailTextLabel?.text = priceArray[indexPath.row]
        
        
        
        
        return cell
    }
    
    

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let FavoriteAction = UITableViewRowAction(style: .destructive, title: "Favorite") { (action, indexpath) in
            
            self.favoriteBeerArray.append(nameArray[indexPath.row])
            
         //   print(self.favoriteBeerArray)
            UserDefaults.standard.set(self.favoriteBeerArray, forKey: "favoriteArray")
          //  print(UserDefaults.standard.array(forKey: "favoriteArray" ))
           
            
            let alert = UIAlertController(title: "Congratulations", message: "You added this beer a your favorite list.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
           
            
            self.present(alert, animated: true)
        }
        FavoriteAction.backgroundColor = .blue
        
        
        
        let BuyAction = UITableViewRowAction(style: .destructive, title: "Buy") { (action, indexpath) in
            let alert = UIAlertController(title: "Congratulations", message: "Enjoy your beer", preferredStyle: .alert)
            
            self.consumptionArray.append(nameArray[indexPath.row])
            UserDefaults.standard.set(self.consumptionArray, forKey: "consumptionArray")
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            
            
            self.present(alert, animated: true)
        }
        BuyAction.backgroundColor = .green
        
       
        return [FavoriteAction,BuyAction]
    }
    
}
