//
//  secondCell.swift
//  TableViewTest
//
//  Created by 신현민 on 2017. 3. 25..
//  Copyright © 2017년 hmmm. All rights reserved.
//

import UIKit

class secondCell: UITableViewCell {
    
    @IBOutlet weak var standardTime: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var activeTime: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
