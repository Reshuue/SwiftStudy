//
//  ViewController.swift
//  Hello_1105
//
//  Created by 전희경 on 2016. 11. 5..
//  Copyright © 2016년 전희경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var current: UILabel!
    @IBOutlet weak var selectDate: UILabel!
    
//    var alarmDate:Date?
    var alarmTime:String?
    var timeSelector:Selector = #selector(ViewController.updateTime)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    func updateTime(){
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        let currentTime = dateFormatter.string(from: currentDate)
        current.text="현재날짜: "+currentTime
        
        if alarmTime == currentTime{
            self.view.backgroundColor = UIColor.red
            
        }
        
        
        
        
        
    }

    @IBAction func changePicker(_ sender: UIDatePicker) {
        datePicker = sender
        let date = DateFormatter()
        date.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
//        alarmDate = select.date
        alarmTime = date.string(from: datePicker.date)
        selectDate.text = "선택시간: "+alarmTime!
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

