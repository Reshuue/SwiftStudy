//
//  Story1ViewController.swift
//  TestStoryBoardReference
//
//  Created by vnenise on 2017. 3. 14..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit

class Story1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
