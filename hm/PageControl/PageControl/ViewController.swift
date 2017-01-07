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
    var cnt = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.gray
        imgView.image = UIImage(named: images[0])
        
        settingSwipeGesture()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pageChanged(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    func responseSwipeGesture(_ swipe: UISwipeGestureRecognizer){
        if(swipe.direction == UISwipeGestureRecognizerDirection.left){
            cnt = cnt < 6 ? cnt+1 : 0
            cnt = cnt >= 6 ? 0 : cnt
        }
        else {
            cnt = cnt == 0 ? 5 : cnt-1
        }
        
        switch swipe.direction {
        case UISwipeGestureRecognizerDirection.left : imgView.image = UIImage(named: images[cnt])
        case UISwipeGestureRecognizerDirection.right : imgView.image = UIImage(named: images[cnt]);
        default: break;
        }
    }
    
    func settingSwipeGesture() {
        let derections: [UISwipeGestureRecognizerDirection] = [.right, .left]
        for derection in derections {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.responseSwipeGesture(_:)))
            swipe.direction = derection
            self.view.addGestureRecognizer(swipe)
        }
    }

}

