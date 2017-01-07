//
//  ViewController.swift
//  PinchGesture
//
//  Created by 신현민 on 2017. 1. 7..
//  Copyright © 2017년 신현민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pinchLabel: UILabel!
    
    var initialFontSize: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        let pinch = UIPinchGestureRecognizer(target:self, action: #selector(doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doPinch(_ pinch:UIPinchGestureRecognizer){
        if pinch.state == .began {
            initialFontSize = pinchLabel.font.pointSize
        }else{
            pinchLabel.font = pinchLabel.font.withSize(initialFontSize * pinch.scale)
        }
    }
}

