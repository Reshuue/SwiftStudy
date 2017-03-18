//
//  Story2ViewController.swift
//  TestStoryBoardReference
//
//  Created by vnenise on 2017. 3. 14..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit

class Story2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
