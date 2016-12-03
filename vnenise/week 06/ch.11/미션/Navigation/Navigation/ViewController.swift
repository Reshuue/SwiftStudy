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
    var isOn = true, isZoom = false
    var imageViewSize:CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imgOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        if imageViewSize != nil{
            imageView.frame.size = imageViewSize
        }
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
        editViewController.isZoom = isZoom
        
        if imageViewSize == nil{
            editViewController.viewSize = imageView.frame.size
        }else{
            editViewController.viewSize = imageViewSize
        }
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
    
    func didImageZoomDone(controller: UIViewController, isZoom: Bool, viewSize: CGSize) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        if self.isZoom != isZoom {
            if isZoom {
                newWidth = viewSize.width*scale
                newHeight = viewSize.height*scale
            }else{
                newWidth = viewSize.width/scale
                newHeight = viewSize.height/scale
            }
            imageViewSize = CGSize(width:newWidth, height:newHeight)
            //imageView.frame.size = imageViewSize
            self.isZoom = !self.isZoom
        }
    }
}

