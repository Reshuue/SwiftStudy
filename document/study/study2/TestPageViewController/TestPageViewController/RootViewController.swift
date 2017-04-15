//
//  RootViewController.swift
//  TestPageViewController
//
//  Created by vnenise on 2017. 2. 18..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchSegment(_ sender: UISegmentedControl) {
        let pageView = self.childViewControllers.first as! PageViewController
        let viewIndex = pages.index(of: (pageView.viewControllers?.first)!)!
        let index = sender.selectedSegmentIndex
        if index > viewIndex {
            pageView.setViewControllers([pages[index]], direction: .forward, animated: true)
        }else{
            pageView.setViewControllers([pages[index]], direction: .reverse, animated: true)
        }
        
    }
}

