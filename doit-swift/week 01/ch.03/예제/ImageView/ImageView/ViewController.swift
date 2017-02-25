//
//  ViewController.swift
//  ImageView
//
//  Created by vnenise on 2016. 10. 28..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var switchBtn: UISwitch!
    
    var imgOn:UIImage?, imgOff:UIImage?, isZoom:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isZoom = false
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        imageView.image = imgOn
        switchBtn.setOn(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func changeScale(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if isZoom {
            newWidth = imageView.frame.size.width/scale
            newHeight = imageView.frame.size.height/scale
            imageView.frame.size = CGSize(width: newWidth, height: newHeight)
            btn.setTitle("확대", for: .normal)
        }else{
            newWidth = imageView.frame.size.width*scale
            newHeight = imageView.frame.size.height*scale
            imageView.frame.size = CGSize(width: newWidth, height: newHeight)
            btn.setTitle("축소", for: .normal)
        }
        isZoom = !isZoom
    }

    @IBAction func changeOnOff(_ sender: UISwitch) {
        if sender.isOn{
            imageView.image = imgOn
        }else{
            imageView.image = imgOff
        }
    }
}

