//
//  ViewController.swift
//  TabView
//
//  Created by vnenise on 2016. 10. 17..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    let timeSelector:Selector = #selector(DateViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmDate:Date? = nil
    var flag1:Bool = true, flag2:Bool = true
    var isPause = false
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     @IBAction func changeDatePicker(_ sender: UIDatePicker) {
     let datePickerView = sender
     let formatter = DateFormatter()
     formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
     print("선택시간: "+formatter.string(from: datePickerView.date))
     lblPickerTime.text = "선택시간: "+formatter.string(from: datePickerView.date)
     }
     
     func updateTime(){
     //lblCurrentTime.text = String(count)
     //count = count+1
     let date = Date()
     let formatter = DateFormatter()
     formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
     lblCurrentTime.text = "현재시간: "+formatter.string(from: date)
     }
     */
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblPickerTime.text = "선택시간: "+formatter.string(from: datePickerView.date)
        
        alarmDate = datePickerView.date
        flag1 = true; flag2 = true;
    }
    
    func updateTime(timer: Timer){
        //lblCurrentTime.text = String(count)
        //count = count+1
        let currentDate = Date()
        let formatter1 = DateFormatter(), formatter2 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        formatter2.dateFormat = "hh:mm:ss aaa"
        
        lblCurrentTime.text = "현재시간: "+formatter1.string(from: currentDate)
        
        //알람 시간 비교
        /*if let alarm = alarmDate{
         if formatter2.string(from:alarm) == formatter2.string(from:currentDate) && flag1{
         self.view.backgroundColor = UIColor.red
         flag1 = false
         }
         
         if formatter2.string(from: alarm.addingTimeInterval(10.0)) == formatter2.string(from:currentDate) && flag2{
         self.view.backgroundColor = UIColor.white
         flag2 = false
         }
         }*/
        
        //알람시간시 경고창 띄움
        if let alarm = alarmDate{
            if formatter2.string(from:alarm) == formatter2.string(from:currentDate) && flag1{
                timer.invalidate()
                flag1 = false
                let alert = UIAlertController(title: "알림", message: "설정된 시간입니다.", preferredStyle: UIAlertControllerStyle.alert)
                
                let action = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertActionStyle.default, handler: {
                    ACTION in
                    Timer.scheduledTimer(timeInterval: self.interval, target: self, selector: self.timeSelector, userInfo: nil, repeats: true)
                })
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
        }
        
    }}

