//
//  EditViewController.swift
//  Navigation
//
//  Created by vnenise on 2016. 12. 1..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

protocol EditDelegate{
    func didMessageEditDone(controller: UIViewController, message: String)
    func didImageOnOffDone(controller:UIViewController, isOn:Bool)
}

class EditViewController: UIViewController {

    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var onoffSwitch: UISwitch!
    
    var textValue = ""
    var textMessage = ""
    var delegate:EditDelegate?
    var isOn = true, isZoom = true
    var viewSize:CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWay.text = textValue
        textField.text = textMessage
        onoffSwitch.isOn = isOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func barbtnDone(_ sender: UIBarButtonItem) {
        if let controller = delegate {
            controller.didMessageEditDone(controller: self, message: textField.text!)
            controller.didImageOnOffDone(controller: self, isOn: isOn)
        }
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if let controller = delegate {
            controller.didMessageEditDone(controller: self, message: textField.text!)
            controller.didImageOnOffDone(controller: self, isOn: isOn)
        }
       _ = self.navigationController?.popViewController(animated: true)
    }

    @IBAction func switchOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        }else{
            isOn = false
        }
    }
}
