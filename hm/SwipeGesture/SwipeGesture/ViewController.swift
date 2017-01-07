//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 신현민 on 2017. 1. 7..
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var upImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var downImageView: UIImageView!
    
    
    var imageUp = [UIImage]()
    var imageDown = [UIImage]()
    var imageLeft = [UIImage]()
    var imageRight = [UIImage]()
    var numberFinger = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageUp.append(UIImage(named: "arrow-up-black.png")!)
        imageUp.append(UIImage(named: "arrow-up-red.png")!)
        imageUp.append(UIImage(named: "arrow-up-green.png")!)
        
        
        imageDown.append(UIImage(named: "arrow-down-black.png")!)
        imageDown.append(UIImage(named: "arrow-down-red.png")!)
        imageDown.append(UIImage(named: "arrow-down-green.png")!)
        
        
        imageLeft.append(UIImage(named: "arrow-left-black.png")!)
        imageLeft.append(UIImage(named: "arrow-left-red.png")!)
        imageLeft.append(UIImage(named: "arrow-left-green.png")!)
        
        
        imageRight.append(UIImage(named: "arrow-right-black.png")!)
        imageRight.append(UIImage(named: "arrow-right-red.png")!)
        imageRight.append(UIImage(named: "arrow-right-green.png")!)
        
        upImageView.image = imageUp[0];
        downImageView.image = imageDown[0];
        leftImageView.image = imageLeft[0];
        rightImageView.image = imageRight[0];
        
        settingSwipeGesture()
        settingMultiSwipeGesture()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func responseSwipeGesture(_ swipe: UISwipeGestureRecognizer){
        upImageView.image = imageUp[0]gi
        downImageView.image = imageDown[0]
        leftImageView.image = imageLeft[0]
        rightImageView.image = imageRight[0]
        
        switch swipe.direction {
            case UISwipeGestureRecognizerDirection.up : upImageView.image = imageUp[1]
            case UISwipeGestureRecognizerDirection.down : downImageView.image = imageDown[1]
            case UISwipeGestureRecognizerDirection.left : leftImageView.image = imageLeft[1]
            case UISwipeGestureRecognizerDirection.right : rightImageView.image = imageRight[1]
            default: break;
        }
    }
    
    func multiResponseSwipeGesture(_ swipe: UISwipeGestureRecognizer){
        upImageView.image = imageUp[0]
        downImageView.image = imageDown[0]
        leftImageView.image = imageLeft[0]
        rightImageView.image = imageRight[0]
        
        switch swipe.direction {
            case UISwipeGestureRecognizerDirection.up : upImageView.image = imageUp[2]
            case UISwipeGestureRecognizerDirection.down : downImageView.image = imageDown[2]
            case UISwipeGestureRecognizerDirection.left : leftImageView.image = imageLeft[2]
            case UISwipeGestureRecognizerDirection.right : rightImageView.image = imageRight[2]
            default: break;
        }
    }
    
    func settingSwipeGesture() {
        let derections: [UISwipeGestureRecognizerDirection] = [.right, .left, .up, .down]
        for derection in derections {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.responseSwipeGesture(_:)))
            swipe.direction = derection
            self.view.addGestureRecognizer(swipe)
        }
    }
    
    func settingMultiSwipeGesture() {
        let derections: [UISwipeGestureRecognizerDirection] = [.right, .left, .up, .down]
        for derection in derections {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.multiResponseSwipeGesture(_:)))
            swipe.direction = derection
            swipe.numberOfTouchesRequired = numberFinger
            self.view.addGestureRecognizer(swipe)
        }
    }

}

