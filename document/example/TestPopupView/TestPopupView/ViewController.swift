//
//  ViewController.swift
//  TestAlertCustom
//
//  Created by vnenise on 2017. 3. 15..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func popup(_ sender: UIButton) {
        let popup = UINib(nibName: "TestPopupView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! TestPopupView
        let viewColor = UIColor.brown
        popup.backgroundColor = viewColor.withAlphaComponent(0.3)
        popup.frame = self.view.frame
        let baseViewColor = UIColor.white
        popup.baseView.backgroundColor = baseViewColor.withAlphaComponent(0.8)
        popup.baseView.layer.cornerRadius = 9.0
        
        self.view.addSubview(popup)
    }
}

