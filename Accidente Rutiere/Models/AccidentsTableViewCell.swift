//
//  AccidentsTableViewCell.swift
//  Accidente Rutiere
//
//  Created by Paul-Cristian Vasile on 28/02/2019.
//  Copyright © 2019 Paul-Cristian Vasile. All rights reserved.
//

import UIKit

class AccidentsTableViewCell: UITableViewCell {

    @IBOutlet weak var accidentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
