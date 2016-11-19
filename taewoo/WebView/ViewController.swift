//
//  ViewController.swift
//  WebView
//
//  Created by 진용호 on 2016. 11. 19..
//  Copyright © 2016년 taewoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var textUrl: UITextField!
    @IBOutlet weak var indicate: UIActivityIndicatorView!
    @IBOutlet weak var isLoading: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadWebPage(url: "http://m.naver.com")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        indicate.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        indicate.stopAnimating()
    }
    
    func loadWebPage(url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.loadRequest(myRequest)
    }
    
    func checkUrl(url:String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnGo(_ sender: UIButton) {
        let strUrl = checkUrl(url: textUrl.text!)
        loadWebPage(url: strUrl)
        textUrl.text = strUrl
        
    }

    @IBAction func btnSite1(_ sender: UIButton) {
        loadWebPage(url: "http://www.daum.net")
    }

    @IBAction func btnSite2(_ sender: UIButton) {
        loadWebPage(url: "http://52.78.69.17/")
    }
    
    @IBAction func btnHtml(_ sender: UIButton) {
        let htmlString = "<h1>HTMP String </h1>"+"<p>String 변수를 이용한 웹페이지</p>"
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnFile(_ sender: UIButton) {
        let htmlBundle = Bundle.main
        let filePath = htmlBundle.path(forResource: "index", ofType: "html")
        loadWebPage(url: filePath!)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func btnRewind(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func btnFoward(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
}

