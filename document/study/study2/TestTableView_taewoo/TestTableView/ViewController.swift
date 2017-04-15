//
//  ViewController.swift
//  TestTableView
//
//  Created by 진용호 on 2017. 3. 25..
//  Copyright © 2017년 kairos. All rights reserved.
//

import UIKit

struct AlarmTime {
    var time: String
    var setDay: String
    var timeStandard: String
    var isAlarm: Bool
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [AlarmTime]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        data = [
            AlarmTime(time:"1:10", setDay:"알람, 화 수 목 금", timeStandard:"AM", isAlarm: true),
            AlarmTime(time:"2:10", setDay:"알람, 매일", timeStandard:"PM", isAlarm: true),
            AlarmTime(time:"3:10", setDay:"알람, 화 금", timeStandard:"PM", isAlarm: false),
            AlarmTime(time:"4:10", setDay:"알람, 화 금", timeStandard:"PM", isAlarm: false),
            AlarmTime(time:"5:10", setDay:"알람, 화 금", timeStandard:"PM", isAlarm: false),
            AlarmTime(time:"6:10", setDay:"알람, 화 금", timeStandard:"AM", isAlarm: true),
            AlarmTime(time:"7:10", setDay:"알람, 화 금", timeStandard:"PM", isAlarm: false),
            AlarmTime(time:"8:10", setDay:"알람, 화 금", timeStandard:"PM", isAlarm: false),
            AlarmTime(time:"9:10", setDay:"알람, 화 금", timeStandard:"PM", isAlarm: true),
            AlarmTime(time:"10:10", setDay:"알람, 화 금", timeStandard:"AM", isAlarm: false),
            AlarmTime(time:"11:10", setDay:"알람, 화 금", timeStandard:"PM", isAlarm: false),
            AlarmTime(time:"12:10", setDay:"알람, 화 금", timeStandard:"PM", isAlarm: false)
        ]
        
        tableView.register(UINib(nibName: "SecondCell", bundle: nil), forCellReuseIdentifier: "secondCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.isScrollEnabled = true
        tableView.alwaysBounceVertical = false
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! SecondCell
        
        cell.time2.text = data[indexPath.row].time
        cell.stTime2.text = data[indexPath.row].timeStandard
        cell.isOn2.isOn = data[indexPath.row].isAlarm
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

}

