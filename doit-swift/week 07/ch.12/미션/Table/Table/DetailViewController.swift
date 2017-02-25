//
//  DetailViewController.swift
//  Table
//
//  Created by vnenise on 2016. 10. 20..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var receiveItem = ""
    
    @IBOutlet weak var lblItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblItem.text = receiveItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func receiveItem(item:String){
        receiveItem = item
    }
}
