//
//  ViewController2.swift
//  TestTableView
//
//  Created by vnenise on 2017. 3. 14..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func back(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: false)
    }
    
}
