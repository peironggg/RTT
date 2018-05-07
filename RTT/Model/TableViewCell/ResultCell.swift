//
//  TableViewCell.swift
//  RTT
//
//  Created by Wu Peirong on 7/5/18.
//  Copyright © 2018 Wu Peirong. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    @IBOutlet weak var qNumber: UILabel!
    @IBOutlet weak var qLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
