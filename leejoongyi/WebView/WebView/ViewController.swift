//
//  ViewController.swift
//  WebView
//
//  Created by LEEJUNGYI on 2016. 11. 19..
//  Copyright © 2016년 omo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loaadWebPage(url: "http://m.naver.com")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loaadWebPage(url:String){
        let myUrl = URL(string:url)
        let myRequest = URLRequest(url:myUrl!)
        webView.loadRequest(myRequest)
    }
    
    func checkUrl(url:String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://"+strUrl
        }
        return strUrl;
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        indicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        indicator.stopAnimating()
    }
    
    @IBAction func goBtn(_ sender: UIButton) {
        let myUrl = checkUrl(url: txtUrl.text!)
        loaadWebPage(url: myUrl)
        txtUrl.text = myUrl
    }
    
    @IBAction func site1Btn(_ sender: UIButton) {
        loaadWebPage(url: "http://www.daum.net")
    }
    
    @IBAction func site2Btn(_ sender: UIButton) {
        loaadWebPage(url: "http://www.omoalarm.com")
    }
    
    @IBAction func htmlBtn(_ sender: UIButton) {
        let htmlString = "<h1>String</h1><p>html</p>"
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func fileBtn(_ sender: UIButton) {
        let htmlBundle = Bundle.main
        let filePath = htmlBundle.path(forResource: "index", ofType: "html")
        loaadWebPage(url: filePath!)
    }
    
    @IBAction func stopBarBtn(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
    @IBAction func refreshBarBtn(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func rewindBarBtn(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func forwardBarBtn(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
}

