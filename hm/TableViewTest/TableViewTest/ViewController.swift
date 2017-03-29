//
//  ViewController.swift
//  TableViewTest
//
//  Created by 신현민 on 2017. 3. 25..
//  Copyright © 2017년 hmmm. All rights reserved.
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
        tableView.dataSource = self
        tableView.delegate = self
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
        
        tableView.register(UINib(nibName: "secondCell", bundle: nil), forCellReuseIdentifier: "secondCell")
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! secondCell
        
        cell.time.text = data[indexPath.row].time
        cell.standardTime.text = data[indexPath.row].timeStandard
        cell.activeTime.isOn = data[indexPath.row].isAlarm
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

}

