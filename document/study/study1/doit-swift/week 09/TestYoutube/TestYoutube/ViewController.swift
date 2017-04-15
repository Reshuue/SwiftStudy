//
//  ViewController.swift
//  TestYoutube
//
//  Created by vnenise on 2017. 1. 20..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class ViewController: UIViewController, YTPlayerViewDelegate {
    
    @IBOutlet weak var video: YTPlayerView!
    let videoId = "LDazB-ksK10"
    
    override func viewDidLoad() {
        video.load(withVideoId: videoId)
        //video.load(withVideoId: videoId, playerVars: ["playsinline":1])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }

}
