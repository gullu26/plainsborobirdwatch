//
//  BirdBoxTableViewCell.swift
//  Plainsboro Birdwatch
//
//  Created by Sudarshan Seshadri on 2/10/19.
//  Copyright © 2019 Avyay's Apps. All rights reserved.
//

import UIKit

class BirdBoxTableViewCell: UITableViewCell {

    @IBOutlet weak var birdImageView: UIImageView!

    @IBOutlet weak var boxNumberLabel: UILabel!
    
    @IBOutlet weak var birdNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
