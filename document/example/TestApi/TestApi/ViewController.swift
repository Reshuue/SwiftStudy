//
//  ViewController.swift
//  TestApi
//
//  Created by vnenise on 2017. 3. 15..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = ["Content-Type":"application/json;charset=UTF-8"]
        let url = "http://192.168.0.6:9090/contents"
        Alamofire.request(
            url, method: .post,
            parameters: ["offset":0,"limit":10],
            encoding: JSONEncoding.default, headers: header
        ).responseJSON {
            (response:DataResponse) in
            switch(response.result) {
            case .success:
                print("value: \(response.value)")
                print("result : \(response.result)")
            case .failure:
                print(response.result.error ?? "error")
                let alertController = UIAlertController(title: "접근 오류", message: "네트워크 접속이 원활하지 않습니다.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "닫기", style: UIAlertActionStyle.default) {
                    UIAlertAction in
                    exit(0)
                }
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        //http통신
        /*
         let url = "http://192.168.0.6:8080/contents/"
         let api_url = URL(string: url)!
         let apidata = try! Data(contentsOf: api_url)
         
         let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? "데이터가 없습니다."
         NSLog("API Result=\(log)")
         */
    }
}

