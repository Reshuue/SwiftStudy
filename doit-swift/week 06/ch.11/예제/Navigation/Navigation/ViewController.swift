//
//  ViewController.swift
//  Navigation
//
//  Created by vnenise on 2016. 12. 1..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit


class ViewController: UIViewController, EditDelegate {

    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    var isOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imgOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editBarButton" {
            editViewController.textValue = "segue : use button"
        }else if segue.identifier == "editButton" {
            editViewController.textValue = "segue : use bar button"
        }
        editViewController.textMessage = txtMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }
    
    func didMessageEditDone(controller: UIViewController, message: String) {
        txtMessage.text = message
    }
    
    func didImageOnOffDone(controller: UIViewController, isOn: Bool) {
        if isOn {
            imageView.image = imgOn
            self.isOn = isOn
        }else{
            imageView.image = imgOff
            self.isOn = isOn
        }
    }
}

