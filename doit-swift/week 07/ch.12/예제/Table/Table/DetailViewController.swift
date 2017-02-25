//
//  DetailViewController.swift
//  Table
//
//  Created by vnenise on 2016. 12. 9..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var receiveItem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text  = receiveItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func receiveItem(item:String){
        receiveItem = item
    }
}
