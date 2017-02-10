//
//  ViewController.swift
//  MoviePlayer
//
//  Created by vnenise on 2016. 11. 21..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func playVideo(url:URL){
        let player = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.present(playerController, animated: true, completion: {player.play()})
    }
    
    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "FastTyping", ofType:"mp4")
        if let path = filePath {
            let url = URL(fileURLWithPath: path)
            playVideo(url: url)
        }else{
            print("path not found")
        }
    }
    
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
       let url = URL(string:"https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
       playVideo(url: url)
    }
}

