//
//  PerfilViewController.swift
//  Michelapp
//
//  Created by Abraham Quezada on 10/9/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {
    
    @IBAction func bartenderTapped(_ sender: UIButton) {
        print("Bartender")
    }
    
    @IBAction func consumerTapped(_ sender: UIButton) {
        print("Consumer")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
