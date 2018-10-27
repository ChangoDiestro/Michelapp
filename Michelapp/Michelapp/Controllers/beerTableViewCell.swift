//
//  beerTableViewCell.swift
//  Michelapp
//
//  Created by Gerardo Castillo on 26/10/18.
//  Copyright © 2018 Abraham Quezada. All rights reserved.
//

import UIKit

class beerTableViewCell: UITableViewCell {

    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgBeer: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    

}
