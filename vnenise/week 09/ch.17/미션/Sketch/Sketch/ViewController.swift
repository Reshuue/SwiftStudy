//
//  ViewController.swift
//  Sketch
//
//  Created by vnenise on 2016. 11. 24..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var lastPoint:CGPoint!
    var lineSize:CGFloat = 2.0
    var lineColor = UIColor.red.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        lastPoint = touch.location(in: imageView)
        print("lastPoint : \(lastPoint.debugDescription)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setLineWidth(lineSize)
        print("lineColor \(lineColor)")
        context?.setStrokeColor(lineColor)
        context?.setLineCap(.round)
        
        let touch = touches.first! as UITouch
        let currentPoint = touch.location(in: imageView)
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height))
        context?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        context?.addLine(to: CGPoint(x: currentPoint.x, y: currentPoint.y))
        context?.strokePath()
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setLineWidth(lineSize)
        print("lineColor \(lineColor)")
        context?.setStrokeColor(lineColor)
        context?.setLineCap(.round)
        
        let touch = touches.first! as UITouch
        let currentPoint = touch.location(in: imageView)
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height))
        context?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        context?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        context?.strokePath()
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        lastPoint = currentPoint
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            imageView.image = nil
        }
    }
    
    @IBAction func clearImageView(_ sender: UIButton) {
        imageView.image = nil
    }
    
    @IBAction func changeLineSize(_ sender: UITextField) {
        guard let sizeLine = sender.text, !sizeLine.isEmpty else {
            print("nil chekc: \(sender.text)")
            return
        }
        lineSize = CGFloat(Float(sizeLine)!)
    }
    
    @IBAction func txtSeletAll(_ sender: UITextField) {
        sender.selectAll(sender)
    }
    
    @IBAction func textDidExit(_ sender: UITextField) {
        guard let sizeLine = sender.text, !sizeLine.isEmpty else {
            print("nil chekc: \(sender.text)")
            return
        }
        lineSize = CGFloat(Float(sizeLine)!)
    }
    
    @IBAction func changeColor(_ sender: AnyObject) {
    guard let button = sender as? UIButton else {
        return
    }
        
    switch (button.titleLabel?.text)! {
        case "검은색":
            lineColor = UIColor.black.cgColor
        case "빨간색":
            lineColor = UIColor.red.cgColor
        case "녹색":
            lineColor = UIColor.green.cgColor
        default:
            lineColor = UIColor.blue.cgColor
        }
    }
}

