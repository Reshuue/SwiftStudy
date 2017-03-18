//
//  ViewController.swift
//  TestTableView
//
//  Created by vnenise on 2017. 3. 13..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...10 {
            let button = UIButton()
            button.frame = CGRect(x: Int((scrollview.frame.width - 30)/2), y: i*60, width: 30, height: 50)
            button.setTitle("\(i)", for: .normal)
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitleColor(UIColor.blue, for: .highlighted)
            button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
            scrollview.addSubview(button)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        scrollview.contentSize = CGSize(width: self.scrollview.frame.width, height: 660)
    }
    
    func buttonClicked(_ sender:UIButton){
        
        switch sender.state {
            case UIControlState.normal: print("normal")
            case UIControlState.focused: print("focused")
            case UIControlState.highlighted: print("highlighted")
            case UIControlState.selected: print("selected")
            case UIControlState.reserved: print("reserved")
            default: print("unknown")
        }
        print("click")
    }
}

