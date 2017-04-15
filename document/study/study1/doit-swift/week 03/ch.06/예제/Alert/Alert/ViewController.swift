//
//  ViewController.swift
//  Alert
//
//  Created by vnenise on 2016. 11. 12..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let imageOn:UIImage = UIImage(named: "lamp-on.png")!
    let imageOff:UIImage = UIImage(named: "lamp-off.png")!
    let imageRemove:UIImage = UIImage(named: "lamp-remove.png")!
    
    var isLampOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnOn(_ sender: UIButton) {
        if isLampOn{
            let alertOn = UIAlertController(title: "경고", message: "켜진 상태입니다.", preferredStyle: UIAlertControllerStyle.alert)
             let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertActionStyle.default, handler: nil)
            alertOn.addAction(onAction)
            present(alertOn, animated: true, completion: nil)
        }else{
            imageView.image = imageOn
            isLampOn = true
        }
        
    }
    
    @IBAction func btnOff(_ sender: UIButton) {
        if isLampOn {
            let alertOff = UIAlertController(title: "경고", message: "끄시겠습니까?", preferredStyle: UIAlertControllerStyle.alert)
            let offAction = UIAlertAction(title: "예, 끄겠습니다.", style: UIAlertActionStyle.default, handler: { action in
                    self.imageView.image = self.imageOff
                    self.isLampOn = false
            })
            
            let onAction = UIAlertAction(title: "아니오.", style: UIAlertActionStyle.default, handler: nil)
            alertOff.addAction(offAction)
            alertOff.addAction(onAction)
            present(alertOff, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnRemove(_ sender: UIButton) {
        let alertRemove = UIAlertController(title: "경고", message: "제거하시겠습니까?", preferredStyle: UIAlertControllerStyle.alert)
        
        if isLampOn {
            let offAction = UIAlertAction(title: "아니오, 끄겠습니다.", style: UIAlertActionStyle.default, handler: { action in
                self.imageView.image = self.imageOff
                self.isLampOn = false
            })
            alertRemove.addAction(offAction)
        }else{
            let onAction = UIAlertAction(title: "아니오, 켜겠습니다.", style: UIAlertActionStyle.default, handler: { action in
                self.imageView.image = self.imageOn
                self.isLampOn = true
            })
            alertRemove.addAction(onAction)
        }
        
        let removeAction = UIAlertAction(title: "제거하겠습니다.", style: UIAlertActionStyle.default, handler: { action in
            self.imageView.image = self.imageRemove
            self.isLampOn = false
        })
        alertRemove.addAction(removeAction)
        present(alertRemove, animated: true, completion: nil)
    }
}

