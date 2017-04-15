//
//  ViewController.swift
//  TestCoreData
//
//  Created by vnenise on 2017. 4. 15..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        
        request.predicate = NSPredicate(format: "name", "test1")    //where name test1
        
        do{
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    let id = result.value(forKey: "id") as? Int64
                    let email = result.value(forKey: "email") as? String
                    let name = result.value(forKey: "name") as? String
                    print("id: \(id!) name: \(name!) email: \(email!)")
                }
            }
        }catch{
            
        }
    }
}
