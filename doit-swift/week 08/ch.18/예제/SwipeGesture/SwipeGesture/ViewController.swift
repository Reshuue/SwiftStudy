//
//  ViewController.swift
//  SwipeGesture
//
//  Created by vnenise on 2016. 11. 25..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var upImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var downImageView: UIImageView!
    
    var imageUp = [UIImage]()
    var imageDown = [UIImage]()
    var imageLeft = [UIImage]()
    var imageRight = [UIImage]()
    var startLocation:CGPoint?
    let numOfTouchs = 2
    
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
        
        upImageView.image = imageUp[0]
        downImageView.image = imageDown[0]
        leftImageView.image = imageLeft[0]
        rightImageView.image = imageRight[0]
        
        settingSwipeGesture()
        //settingPanGesture()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func respondSwipeGesture(_ gestrue:UISwipeGestureRecognizer){
        upImageView.image = imageUp[0]
        downImageView.image = imageDown[0]
        leftImageView.image = imageLeft[0]
        rightImageView.image = imageRight[0]
        
        switch gestrue.direction {
            case UISwipeGestureRecognizerDirection.up:
                upImageView.image = imageUp[1]
            case UISwipeGestureRecognizerDirection.down:
                downImageView.image = imageDown[1]
            case UISwipeGestureRecognizerDirection.left:
                leftImageView.image = imageLeft[1]
            case UISwipeGestureRecognizerDirection.right:
                rightImageView.image = imageRight[1]
            default:
                break
        }
    }
    
    func respondSwipeMutiGesture(_ gestrue:UISwipeGestureRecognizer){
        upImageView.image = imageUp[0]
        downImageView.image = imageDown[0]
        leftImageView.image = imageLeft[0]
        rightImageView.image = imageRight[0]
        
        switch gestrue.direction {
        case UISwipeGestureRecognizerDirection.up:
            upImageView.image = imageUp[2]
        case UISwipeGestureRecognizerDirection.down:
            downImageView.image = imageDown[2]
        case UISwipeGestureRecognizerDirection.left:
            leftImageView.image = imageLeft[2]
        case UISwipeGestureRecognizerDirection.right:
            rightImageView.image = imageRight[2]
        default:
            break
        }
    }
    
    func settingSwipeGesture(){
        //single
        let directions: [UISwipeGestureRecognizerDirection] = [.right, .left, .up, .down]
        for direction in directions {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondSwipeGesture(_:)))
            swipe.direction = direction
            self.view.addGestureRecognizer(swipe)
        }
        
        /*
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        */
        
        
        //multi
        for direction in directions {
            let multiSwipe = UISwipeGestureRecognizer(target: self, action: #selector(respondSwipeMutiGesture(_:)))
            multiSwipe.direction = direction
            multiSwipe.numberOfTouchesRequired = numOfTouchs
            self.view.addGestureRecognizer(multiSwipe)
        }
        
        /*
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(respondSwipeMutiGesture(_:)))
        swipeUpMulti.direction = UISwipeGestureRecognizerDirection.up
        swipeUpMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeUpMulti)
        
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(respondSwipeMutiGesture(_:)))
        swipeDownMulti.direction = UISwipeGestureRecognizerDirection.down
        swipeDownMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeDownMulti)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(respondSwipeMutiGesture(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizerDirection.left
        swipeLeftMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(respondSwipeMutiGesture(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizerDirection.right
        swipeRightMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeRightMulti)
         */
    }

    
    func respondPanGesture(_ gestrue:UIPanGestureRecognizer){
        let touchLocation = gestrue.location(in: self.view)
        
        if touchLocation.x >= self.rightImageView.center.x {   //right
            rightImageView.image = imageRight[1]
            upImageView.image = imageUp[0]
            downImageView.image = imageDown[0]
            leftImageView.image = imageLeft[0]
        }else if touchLocation.x <= self.leftImageView.center.x { //left
            leftImageView.image = imageLeft[1]
            upImageView.image = imageUp[0]
            downImageView.image = imageDown[0]
            rightImageView.image = imageRight[0]
        }else if touchLocation.y <= self.upImageView.center.y { //up
            upImageView.image = imageUp[1]
            downImageView.image = imageDown[0]
            leftImageView.image = imageLeft[0]
            rightImageView.image = imageRight[0]
        }else if touchLocation.y >= self.downImageView.center.y { //down
            downImageView.image = imageDown[1]
            upImageView.image = imageUp[0]
            leftImageView.image = imageLeft[0]
            rightImageView.image = imageRight[0]
        }
        
        if gestrue.state == .ended {
            print("end")
            upImageView.image = imageUp[0]
            downImageView.image = imageDown[0]
            leftImageView.image = imageLeft[0]
            rightImageView.image = imageRight[0]
        }
    }
    
    func settingPanGesture(){
        let pan = UIPanGestureRecognizer(target: self, action: #selector(respondPanGesture(_:)))
        self.view.addGestureRecognizer(pan)
    }
}

