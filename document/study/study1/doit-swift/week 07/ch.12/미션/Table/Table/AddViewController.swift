//
//  AddViewController.swift
//  Table
//
//  Created by vnenise on 2016. 10. 20..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var image:UIImage?
    var imageItem:String?
    var imageName:String?
    let PICKER_VIEW_COLUMN = 1
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageName = itemsImageFile[0]
        imageView.image = UIImage(named: imageName!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemsImageFile.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imgView = UIImageView(image: UIImage(named:itemsImageFile[row]))
        imgView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        return imgView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageName = itemsImageFile[row]
        imageView.image = UIImage(named:imageName!)
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }

    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append(imageName!)
        tfAddItem.text=""
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
}
