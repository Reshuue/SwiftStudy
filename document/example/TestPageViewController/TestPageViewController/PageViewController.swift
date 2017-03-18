//
//  PageViewController.swift
//  TestPageViewController
//
//  Created by vnenise on 2017. 3. 12..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit

var pages = [UIViewController]()

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var segment:UISegmentedControl!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //delegate, datasource self
        self.dataSource = self
        self.delegate = self
        
        //childView append
        let page1: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "view1")
        let page2: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "view2")
        let page3: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "view3")
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        //setting default view
        setViewControllers([page1], direction: .forward, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let rootView = parent as! RootViewController
        segment = rootView.segment
        segment.selectedSegmentIndex = 0
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.index(of: viewController)!
        if currentIndex-1 >= 0 {
            return pages[currentIndex-1]
        }else{
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.index(of: viewController)!
        if currentIndex+1 < pages.count {
            return pages[currentIndex+1]
        }else{
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        //after animating segment setting
        guard completed else { return }
        let index = pages.index(of: (pageViewController.viewControllers?.first)!)!
        segment.selectedSegmentIndex = index
    }
}
