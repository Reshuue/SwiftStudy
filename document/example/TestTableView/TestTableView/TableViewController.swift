//
//  TableViewController.swift
//  TestTableView
//
//  Created by vnenise on 2017. 3. 13..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var tableData = [String]()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 1...100{
            tableData.append("test\(index)")
        }
        
        tableView.register(UINib(nibName: "TableCell1", bundle: nil), forCellReuseIdentifier: "cell1")
        tableView.register(UINib(nibName: "TableCell2", bundle: nil), forCellReuseIdentifier: "cell2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableCell1
            cell.label.text = tableData[indexPath.row]
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableCell2
            cell.label.text = tableData[indexPath.row]
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.parent!.view.frame.width
    }
}
