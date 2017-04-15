//
//  ViewController.swift
//  TestSwRevealViewController
//
//  Created by vnenise on 2017. 4. 15..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit
import SWRevealViewController


class ViewController: UIViewController {
    
    @IBOutlet weak var menu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    @IBAction func dismissMain(segue:UIStoryboardSegue){
        
    }
}
