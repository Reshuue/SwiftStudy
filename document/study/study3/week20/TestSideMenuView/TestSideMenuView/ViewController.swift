//
//  ViewController.swift
//  TestSideMenuView
//
//  Created by vnenise on 2017. 4. 16..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSideMenu()
    }
    
    
    fileprivate func setupSideMenu() {
        let leftMenu = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? UISideMenuNavigationController
        SideMenuManager.menuLeftNavigationController = leftMenu
        
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view, forMenu: .left)
        
        SideMenuManager.menuAnimationBackgroundColor = UIColor.clear
    }
    
}
