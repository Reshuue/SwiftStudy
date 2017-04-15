//
//  ViewController.swift
//  ImagerView_Mission
//
//  Created by vnenise on 2016. 10. 30..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView2: UIImageView!
    
    var imageName = ["01.png","02.png","03.png","04.png","05.png","06.png"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView2.image = UIImage(named: imageName[index])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func prevImage(_ sender: UIButton) {
        index = index-1
        
        if index < 0 {
            index = imageName.count-1
        }
        imageView2.image = UIImage(named: imageName[index])
    }
    
    @IBAction func nextImage(_ sender: UIButton) {
        index = index+1
        
        if index >= imageName.count {
            index = 0
        }
        imageView2.image = UIImage(named: imageName[index])
    }
}

