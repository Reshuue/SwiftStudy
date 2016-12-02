//
//  TabBarController.swift
//  Tab
//
//  Created by vnenise on 2016. 12. 1..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("select index: \(tabBarController.selectedIndex)")
        print("select class : \(String(describing: type(of: viewController)))")
    }
}
