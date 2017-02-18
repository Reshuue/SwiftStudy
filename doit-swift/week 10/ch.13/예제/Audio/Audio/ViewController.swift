//
//  ViewController.swift
//  Audio
//
//  Created by vnenise on 2017. 1. 30..
//  Copyright © 2017년 vnenise. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    //재생 outlet
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    
    var audioPlayer:AVAudioPlayer!
    var audioFile:URL!
    let MAX_VOLUME:Float = 10.0
    var progressTimer:Timer!
    let timePlayerSelector:Selector = #selector(ViewController.updatePlayTime)
    
    //녹음 outlet
    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var recordTimeLabel: UILabel!
    
    var audioRecorder:AVAudioRecorder!
    var isRecordMode = false
    let timeRecordSelector:Selector = #selector(ViewController.updateRecordTime)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        selectAudioFile()   //음성파일 선택
        if !isRecordMode{
            initPlay()  //재생초기화
            btnRecord.isEnabled = false
            recordTimeLabel.isEnabled = false
        }else{
            initRecord()  //녹음초기화
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func selectAudioFile(){
        if !isRecordMode {
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        }else{
            let documentDirectory:URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
        }
    }
    
    func initPlay(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        }catch{
            print("Error-initPlay : \(error)")
        }
        slider.maximumValue = MAX_VOLUME
        slider.value = 1.0
        progress.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slider.value
        
        endTimeLabel.text = convertTimeIntervalToString(time: audioPlayer.duration)
        currentTimeLabel.text = convertTimeIntervalToString(time: 0)
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
        
        slider.value = 1.0
        audioPlayer.volume = slider.value
        endTimeLabel.text = convertTimeIntervalToString(time: 0)
        currentTimeLabel.text = convertTimeIntervalToString(time: 0)
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
    
    func convertTimeIntervalToString(time:TimeInterval) -> String {
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        
        return strTime
    }
    
    func updatePlayTime(){
        currentTimeLabel.text = convertTimeIntervalToString(time: audioPlayer.currentTime)
        progress.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
    func updateRecordTime(){
        recordTimeLabel.text = convertTimeIntervalToString(time: audioRecorder.currentTime)
    }
    
    func setPlayButton(play:Bool, pause:Bool, stop:Bool){
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    @IBAction func changeSilder(_ sender: UISlider) {
        audioPlayer.volume = slider.value
    }
    
    @IBAction func pressPlay(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButton(play: false, pause: true, stop: true)
        progressTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func pressPause(_ sender: UIButton) {
        audioPlayer.pause()
        progressTimer.invalidate()
        setPlayButton(play: true, pause: false, stop: true)
    }
    
    @IBAction func pressStop(_ sender: UIButton) {
        audioPlayer.stop()
        progressTimer.invalidate()
        audioPlayer.currentTime = 0
        currentTimeLabel.text = convertTimeIntervalToString(time:0)
        setPlayButton(play: true, pause: false, stop: false)
        progressTimer.invalidate()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        currentTimeLabel.text = convertTimeIntervalToString(time:0)
        setPlayButton(play: true, pause: false, stop: false)
    }
    
    @IBAction func changeSwitch(_ sender: UISwitch) {
        if sender.isOn{
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            currentTimeLabel.text = convertTimeIntervalToString(time: 0)
            isRecordMode = true
            btnRecord.isEnabled = true
            recordTimeLabel.isEnabled = true
        }else{
            isRecordMode = false
            btnRecord.isEnabled = false
            recordTimeLabel.isEnabled = false
            recordTimeLabel.text = convertTimeIntervalToString(time: 0)
        }
        selectAudioFile()
        if !isRecordMode{
            initPlay()
        }else{
            initRecord()
        }
    }
    
    @IBAction func pressRecord(_ sender: UIButton) {
        if sender.titleLabel?.text == "Record" {
            audioRecorder.record()
            sender.setTitle("stop", for: .normal)
            progressTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
        }else{
            audioRecorder.stop()
            sender.setTitle("Record", for: .normal)
            btnPlay.isEnabled = true
            initPlay()
        }
    }
}

