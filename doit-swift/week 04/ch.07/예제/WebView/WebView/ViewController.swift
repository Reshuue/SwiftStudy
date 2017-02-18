//
//  ViewController.swift
//  WebView
//
//  Created by vnenise on 2016. 11. 20..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        loadWebPage(url: "http://m.naver.com")
    }
    
    func loadWebPage(url:String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.loadRequest(myRequest)
    }
    
    func checkUrl(url:String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        
        if !flag {
            strUrl = "http://"+strUrl
        }
        return strUrl
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        indicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        indicator.stopAnimating()
        //indicator.hidesWhenStopped = true
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(url: txtUrl.text!)
        loadWebPage(url: myUrl)
        txtUrl.text = myUrl
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage(url: "http://www.daum.net")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage(url: "http://www.nate.com")
    }
    
    @IBAction func btnGoHtml(_ sender: UIButton) {
        let htmlString = "<h1>HTML String </h1>"+"<p>String 변수를 이용한 웹페이지</p>"
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnGoFile(_ sender: UIButton) {
        let htmlBundle = Bundle.main
        let filePath = htmlBundle.path(forResource: "index", ofType: "html")
        print("path: \(filePath)")
        loadWebPage(url: filePath!)
    }
    
    //toolbar
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func btnRewind(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func btnForward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
}
