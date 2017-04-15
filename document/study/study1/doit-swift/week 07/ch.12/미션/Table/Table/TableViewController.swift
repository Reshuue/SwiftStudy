//
//  TableViewController.swift
//  Table
//
//  Created by vnenise on 2016. 10. 20..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tvListView.separatorColor = UIColor.clear
        self.editButtonItem.title = "수정"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing,animated:animated)
        if self.isEditing {
            self.editButtonItem.title = "완료"
        }else{
            self.editButtonItem.title = "수정"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(item: items[(indexPath?.row)!])
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = UIImage(named:itemsImageFile[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            print("row : \(indexPath.row)")
            items.remove(at: indexPath.row)
            itemsImageFile.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }else if editingStyle == .insert{
            
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = items[sourceIndexPath.row]
        let itemImageToMove = itemsImageFile[sourceIndexPath.row]
        items.remove(at: sourceIndexPath.row)
        itemsImageFile.remove(at: sourceIndexPath.row)
        items.insert(itemToMove, at: destinationIndexPath.row)
        itemsImageFile.insert(itemImageToMove, at: destinationIndexPath.row)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
