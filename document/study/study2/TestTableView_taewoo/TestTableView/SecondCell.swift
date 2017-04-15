//
//  SecondCell.swift
//  TestTableView
//
//  Created by 진용호 on 2017. 3. 25..
//  Copyright © 2017년 kairos. All rights reserved.
//

import UIKit

class SecondCell: UITableViewCell {

    @IBOutlet weak var isOn2: UISwitch!
    @IBOutlet weak var stTime2: UILabel!
    @IBOutlet weak var time2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
