//
//  DesccriptionViewController.swift
//  Michelapp
//
//  Created by Gerardo Castillo on 27/10/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class DesccriptionViewController: UIViewController {
    
    @IBOutlet weak var imgBeer: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblDescription: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = nameArray[myIndex]
        lblPrice.text = priceArray[myIndex]
        lblDescription.text = descriptionArray[myIndex]
        let url = URL(string: imageURLArray[myIndex])
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.imgBeer.image = UIImage(data: data!)
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
