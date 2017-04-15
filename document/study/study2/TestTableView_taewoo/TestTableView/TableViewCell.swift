//
//  TableViewCell.swift
//  TestTableView
//
//  Created by 진용호 on 2017. 3. 25..
//  Copyright © 2017년 kairos. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var stTime: UILabel!
    @IBOutlet weak var isOn: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
