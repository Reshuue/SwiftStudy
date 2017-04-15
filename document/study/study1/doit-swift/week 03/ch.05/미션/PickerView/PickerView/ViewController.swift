//
//  ViewController.swift
//  PickerView
//
//  Created by vnenise on 2016. 11. 12..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    let imageName = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
    var images = [UIImage]()
    let COLUMN_COUNT = 2
    let ROW_HEIGHT:CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        for name in imageName{
            let image = UIImage(named:name)
            images.append(image!)
        }
        label.text = "select item: "+imageName[0]
        imageView.image = images[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return COLUMN_COUNT
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return ROW_HEIGHT
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        /*switch component{
            case 0 : label.text = "select item: "+imageName[row]
            default: imageView.image = images[row]
        }*/
        
        if component == 0 {
            label.text = "select item: "+imageName[row]
        }else{
            imageView.image = images[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: images[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 150)
        
        return imageView
    }
}

