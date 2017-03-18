//
//  ViewController.swift
//  TestCollectionView
//
//  Created by vnenise on 2016. 12. 19..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit
import Alamofire

struct Contents {
    var ageLimit:Bool?
    var contentsGroupId:String?
    var contentsType:String?
    var createDate:Date?
    var delflag:Bool?
    var id:Int64?
    var imageId:Int64?
    var imageUrl:String?
    var subtitle:String?
    var title:String?
    var tag:String?
    var updateDate:Date?
    var viewcount:Int64?
    var viewstyle:Int64?
    
    init(data: NSDictionary) {
        ageLimit = data.value(forKeyPath: "ageLimit") as? Bool
        contentsGroupId = data.value(forKeyPath: "contentsGroupId") as? String
        contentsType = data.value(forKeyPath: "contentsType") as? String
        createDate = data.value(forKeyPath: "createDate") as? Date
        delflag = data.value(forKeyPath: "delflag") as? Bool
        id = data.value(forKeyPath: "id") as? Int64
        imageId = data.value(forKeyPath: "imageId") as? Int64
        imageUrl = data.value(forKeyPath: "imageUrl") as? String
        subtitle = data.value(forKeyPath: "subtitle") as? String
        title = data.value(forKeyPath: "title") as? String
        tag = data.value(forKeyPath: "tag") as? String
        updateDate = data.value(forKeyPath: "updateDate") as? Date
        viewcount = data.value(forKeyPath: "viewcount") as? Int64
        viewstyle = data.value(forKeyPath: "viewstyle") as? Int64
    }
}

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var contentList = [Contents]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //list = [["test1","test2","test3","test4"], ["test5","test6","test7","test8","test9"]]
        
        let header = ["Content-Type":"application/json;charset=UTF-8"]
        Alamofire.request("http://localhost:8080/api/contents", method: .post, parameters: [:], encoding: JSONEncoding.default, headers: header).responseJSON { (response:DataResponse) in
            switch(response.result) {
            case .success:
                if let data = response.result.value as! NSDictionary? {
                    if data["results"] != nil {
                        let list = data["results"] as! NSArray
                        
                        for contents in list {
                            self.contentList.append(Contents(data:contents as! NSDictionary))
                        }
                        
                        for con in self.contentList{
                            print(con)
                        }
                    }
                }
                self.collectionView.reloadData()
            case .failure:
                print(response.result.error ?? "error")
                //LaunchScreen storyboard 검색 후 해당 controller 읽어들여 변수세
                
                //알림창
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
         let url = "http://localhost:8080/contents/"
         let api_url = URL(string: url)!
         let apidata = try! Data(contentsOf: api_url)
         
         let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? "데이터가 없습니다."
         NSLog("API Result=\(log)")
         */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return contentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        cell.layer.cornerRadius = 10.0
        cell.layer.borderWidth = 1.0
        cell.layer.masksToBounds = true
        cell.layer.borderColor = UIColor.clear.cgColor
        
        let label = cell.viewWithTag(1) as! UILabel
        label.font = label.font.withSize(10)
        label.text = contentList[indexPath.row].title!
        
        return cell;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 10
        
        return CGSize(width: width, height: width)
    }
}

