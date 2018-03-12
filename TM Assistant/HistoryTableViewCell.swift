//
//  HistoryTableViewCell.swift
//  TM Assistant
//
//  Created by Alan You on 3/11/18.
//  Copyright © 2018 Alan You. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var outerBox: UILabel!
    @IBOutlet weak var innerBox: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var detailText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
