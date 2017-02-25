//
//  ViewController.swift
//  DatePicker
//
//  Created by vnenise on 2016. 11. 5..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var selectLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var timeSelector:Selector = #selector(ViewController.updateTime)
    
    var alarmTime:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    func updateTime(){
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        let currentTime = dateFormatter.string(from: currentDate)
        currentLabel.text = "현재날짜: "+currentTime
        
        if(currentTime == alarmTime){
            self.view.backgroundColor = UIColor.red
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func changePicker(_ sender: UIDatePicker) {
        datePicker = sender
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        //alarmDate = datePicker.date
        alarmTime = dateFormatter.string(from: datePicker.date)
        selectLabel.text = "선택시간 :"+alarmTime!
    }
}

