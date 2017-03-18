//
//  TestPopupView.swift
//  TestAlertCustom
//
//  Created by vnenise on 2017. 3. 15..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit

class TestPopupView: UIView {
    
    @IBOutlet weak var baseView: UIView!
    
    @IBAction func closeBtn(_ sender: UIButton) {
        self.removeFromSuperview()
    }

}
