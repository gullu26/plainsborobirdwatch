//
//  BirdListTableViewCell.swift
//  Plainsboro Birdwatch
//
//  Created by Sudarshan Seshadri on 2/20/19.
//  Copyright © 2019 Avyay's Apps. All rights reserved.
//

import UIKit

class BirdListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var birdImage: UIImageView!
    
    @IBOutlet weak var birdNameLabel: UILabel!
    
    @IBOutlet weak var birdDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
