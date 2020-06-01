//
//  EmployCell.swift
//  CachePOC
//
//  Created by Harsh Rajput on 02/06/20.
//  Copyright © 2020 Harsh Rajput. All rights reserved.
//

import UIKit

class EmployCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
   
    @IBOutlet weak var Id: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setemploy(user:Coffee){
        name.text = user.name
        Id.text = user.id
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
