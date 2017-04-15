//
//  AddViewController.swift
//  Table
//
//  Created by vnenise on 2016. 12. 9..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addBtn(_ sender: Any) {
        items.append(textField.text!)
        itemsImageFile.append("clock")
        textField.text = ""
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
}
