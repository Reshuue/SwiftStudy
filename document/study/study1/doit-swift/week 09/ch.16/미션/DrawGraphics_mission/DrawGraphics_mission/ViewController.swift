//
//  ViewController.swift
//  DrawGraphics_mission
//
//  Created by vnenise on 2016. 11. 23..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawFlower()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func drawFlower() {
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        // Draw Triangle
        context?.setLineWidth(3.0)
        context?.setStrokeColor(UIColor.green.cgColor)
        context?.setFillColor(UIColor.green.cgColor)
        
        context?.move(to: CGPoint(x: 140, y: 200))
        context?.addLine(to: CGPoint(x: 170, y: 450))
        context?.addLine(to: CGPoint(x: 110, y: 450))
        context?.addLine(to: CGPoint(x: 140, y: 200))
        context?.fillPath()
        context?.strokePath()
        
        // Draw Circle
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.red.cgColor)
        
        context?.addEllipse(in: CGRect(x: 90, y: 150, width: 100, height: 100))
        context?.addEllipse(in: CGRect(x: 90+50, y: 150, width: 100, height: 100))
        context?.addEllipse(in: CGRect(x: 90-50, y: 150, width: 100, height: 100))
        context?.addEllipse(in: CGRect(x: 90, y: 150-50, width: 100, height: 100))
        context?.addEllipse(in: CGRect(x: 90, y: 150+50, width: 100, height: 100))
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

}

