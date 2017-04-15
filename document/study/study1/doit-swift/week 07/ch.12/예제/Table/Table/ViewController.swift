//
//  ViewController.swift
//  Table
//
//  Created by vnenise on 2016. 12. 3..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

var items = ["책 구매","철수와 약속", "스터디 준비하기"]
var itemsImageFile = ["cart","clock","pencil"]

class ViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tableView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(item: items[(indexPath?.row)!])
        }
    }
    
    //section 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //section에 대한 row갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //table cell 정의
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = UIImage(named: itemsImageFile[indexPath.row])
        
        return cell;
    }
    
    //이동기능 추가
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("\(sourceIndexPath.row) , \(destinationIndexPath.row)")
        let itemToMove = items[sourceIndexPath.row]
        let itemImageToMove = itemsImageFile[sourceIndexPath.row]
        items.remove(at: sourceIndexPath.row)
        itemsImageFile.remove(at: sourceIndexPath.row)
        items.insert(itemToMove, at: destinationIndexPath.row)
        itemsImageFile.insert(itemImageToMove, at: destinationIndexPath.row)
    }
    
    //수정모드에 대한 정의
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            itemsImageFile.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }else if editingStyle == .insert {
            
        }
    }
    
    //delete모드 text수정
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
}

