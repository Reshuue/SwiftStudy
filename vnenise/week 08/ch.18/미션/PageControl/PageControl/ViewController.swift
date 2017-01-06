//
//  ViewController.swift
//  PageControl
//
//  Created by vnenise on 2016. 10. 15..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = ["01.png","02.png","03.png","04.png","05.png","06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.gray
        imgView.image = UIImage(named: images[0])
        
        imgView.isUserInteractionEnabled = true
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.imgView.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.imgView.addGestureRecognizer(swipeRight)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pageChanged(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    func respondToSwipeGesture(gesture: UISwipeGestureRecognizer){
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.left:
            if pageControl.currentPage > 0 {
                pageControl.currentPage -= 1
            }else{
                pageControl.currentPage = images.count-1
            }
            imgView.image = UIImage(named: images[pageControl.currentPage])
        case UISwipeGestureRecognizerDirection.right:
            if pageControl.currentPage < images.count-1 {
                pageControl.currentPage += 1
            }else{
                pageControl.currentPage = 0
            }
            imgView.image = UIImage(named: images[pageControl.currentPage])
        default :
            break
        }
        
    }
}

