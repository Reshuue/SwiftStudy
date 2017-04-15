//
//  View2Controller.swift
//  PinchGesture
//
//  Created by vnenise on 2016. 11. 25..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class View2Controller: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(doPinch(_:)))
        pinch.delegate = self
        self.view.addGestureRecognizer(pinch)
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(doRotation(_:)))
        rotate.delegate = self
        self.view.addGestureRecognizer(rotate)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doPinch(_ pinch:UIPinchGestureRecognizer) {
        imageView.transform = imageView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
    
    func doRotation(_ rotation:UIRotationGestureRecognizer) {
        imageView.transform = imageView.transform.rotated(by: rotation.rotation)
        rotation.rotation = 0
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
