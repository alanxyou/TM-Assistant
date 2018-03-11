//
//  TableViewCell.swift
//  TM Assistant
//
//  Created by Alan You on 3/10/18.
//  Copyright © 2018 Alan You. All rights reserved.
//

import UIKit

class CorporationTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagOne: UILabel!
    @IBOutlet weak var tagTwo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
