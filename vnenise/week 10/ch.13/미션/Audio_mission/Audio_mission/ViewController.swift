//
//  ViewController.swift
//  Audio
//
//  Created by vnenise on 2016. 10. 24..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    @IBOutlet weak var pvProgressPlay: UIProgressView!
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var slVolume: UISlider!
    @IBOutlet weak var btnRecordMode: UISwitch!
    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var lblRecordTime: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    
    var audioPlayer:AVAudioPlayer!
    var audioFile:URL!
    let MAX_VOLUME:Float=10.0
    var progressTimer:Timer!
    let timePlayerSelector:Selector = #selector(ViewController.updatePlayTime)
    var audioRecorder:AVAudioRecorder!
    var isRecordMode = false
    let timeRecordSelector:Selector = #selector(ViewController.updateRecordTime)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectAudioFile()
        statusImage.image = UIImage(named:"stop.png")!
        if !isRecordMode {
            print("play init")
            initPlay()
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
        }else{
            print("record init")
            initRecord()
        }
    }
    
    func updateRecordTime(){
        lblRecordTime.text = convertTimeIntervalToString(time: audioRecorder.currentTime)
    }
    
    func initPlay(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        }catch{
            print("Error-initPlay : \(error)")
        }
        slVolume.maximumValue = MAX_VOLUME
        slVolume.value = 1.0
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        
        lblEndTime.text = convertTimeIntervalToString(time: audioPlayer.duration)
        lblCurrentTime.text = convertTimeIntervalToString(time: 0)
        setPlayButton(play: true, pause: false, stop: false)
    }
    
    func initRecord(){
        let recordSettigs = [
            AVFormatIDKey:NSNumber(value: kAudioFormatAppleLossless),
            AVEncoderAudioQualityKey:AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey: 320000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0
        ] as [String : Any]
        
        do{
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettigs)
        }catch{
            print("Error-initRecord : \(error)")
        }
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        
        slVolume.value = 1.0
        audioPlayer.volume = slVolume.value
        lblEndTime.text = convertTimeIntervalToString(time: 0)
        lblCurrentTime.text = convertTimeIntervalToString(time: 0)
        setPlayButton(play: false, pause: false, stop: false)
        
        let session = AVAudioSession.sharedInstance()
        do{
         try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        } catch{
            print("Error-setCategory : \(error)")
        }
        
        do{
            try session.setActive(true)
        }catch{
            print("Error-setActive : \(error)")
        }
            
    }
    
    func selectAudioFile(){
        if !isRecordMode {
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        }else{
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
        }
    }
    
    func updatePlayTime(){
        lblCurrentTime.text = convertTimeIntervalToString(time: audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }

    func setPlayButton(play:Bool, pause:Bool, stop:Bool){
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    func convertTimeIntervalToString(time:TimeInterval) -> String {
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        
        return strTime
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButton(play: true, pause: false, stop: false)
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        statusImage.image = UIImage(named:"play.png")!
        audioPlayer.play()
        setPlayButton(play: false, pause: true, stop: true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }

    @IBAction func btnPauseAudio(_ sender: UIButton) {
        statusImage.image = UIImage(named:"pause.png")!
        audioPlayer.stop()
        setPlayButton(play: true, pause: false, stop: true)
    }
    
    @IBAction func btnStopAudio(_ sender: UIButton) {
        statusImage.image = UIImage(named:"stop.png")!
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        lblCurrentTime.text = convertTimeIntervalToString(time:0)
        setPlayButton(play: true, pause: false, stop: false)
        progressTimer.invalidate()
    }
    
    @IBAction func siChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    @IBAction func swRecord(_ sender: UISwitch) {
        if sender.isOn{
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            lblCurrentTime.text = convertTimeIntervalToString(time: 0)
            isRecordMode = true
            btnRecord.isEnabled = true
            lblRecordTime.isEnabled = true
        }else{
            isRecordMode = false
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
            lblRecordTime.text = convertTimeIntervalToString(time: 0)
        }
        selectAudioFile()
        if !isRecordMode{
            print("play")
            initPlay()
        }else{
            print("record")
            initRecord()
        }
        statusImage.image = UIImage(named:"stop.png")!
    }
    
    @IBAction func btnRecord(_ sender: UIButton) {
        if sender.titleLabel?.text == "Record" {
            statusImage.image = UIImage(named:"record.png")!
            audioRecorder.record()
            sender.setTitle("stop", for: .normal)
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
        }else{
            statusImage.image = UIImage(named:"stop.png")!
            audioRecorder.stop()
            sender.setTitle("Record", for: .normal)
            btnPlay.isEnabled = true
            initPlay()
        }
    }
}

