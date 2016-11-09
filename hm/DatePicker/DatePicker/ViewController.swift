//
//  ViewController.swift
//  DatePicker
//
//  Created by HM on 2016. 11. 5..
//  Copyright © 2016년 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var selectLabel: UILabel!
    
    var alarmTime:String?
    
    var timeSelector:Selector = #selector(ViewController.updateTime)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateTime() {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        let currentTime = formatter.string(from: currentDate)
        currentLabel.text = "현재날짜 : " + currentTime
        
        if(currentTime == alarmTime){
            self.view.backgroundColor = UIColor.red;
        }
    }
    
    @IBAction func changePicker(_ sender: UIDatePicker) {
        datePicker = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd HH:mm:ss EEE"
        alarmTime = formatter.string(from: datePicker.date)
        selectLabel.text = "선택날짜 : " + alarmTime!
    }

}

