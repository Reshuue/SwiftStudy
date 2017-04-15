//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by vnenise on 2016. 11. 22..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker:UIImagePickerController = UIImagePickerController()
    var captureImage:UIImage!
    var videoURL:URL!
    var flagImageSave = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func myAlert(_ title:String, _ message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        if mediaType.isEqual(to: kUTTypeImage as NSString as String){
            captureImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            imageView.image = captureImage
        }else if mediaType.contains(kUTTypeMovie as String){
            videoURL = (info[UIImagePickerControllerMediaURL] as! URL)
            if flagImageSave {
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
            imageView.image = thumbnail(sourceURL: videoURL)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func thumbnail(sourceURL:URL) -> UIImage {
        // case 1
        do {
            let asset = AVURLAsset(url: sourceURL, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            
            return thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return UIImage(named: "default.png")!
        }
        
        /* case2
        do {
            let asset = AVAsset(url: sourceURL)
            let imageGenerator = AVAssetImageGenerator(asset: asset)
            let time = CMTime(seconds: 1, preferredTimescale: 1)
            let imageRef = try imageGenerator.copyCGImage(at: time, actualTime: nil)
            return UIImage(cgImage: imageRef)
        } catch {
            print(error)
            return UIImage(named: "some generic thumbnail")!
        }
        */
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            flagImageSave = true
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }else{
            myAlert("Camera inaccessabel", "Application cannot access the camera")
        }
    }

    
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            flagImageSave = false
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }else{
            myAlert("Photo inaccessabel", "Application cannot access the photo album.")
        }
    }
    
    
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            flagImageSave = true
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }else{
            myAlert("Camera inaccessabel", "Application cannot access the camera.")
        }
    }
    
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            flagImageSave = false
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }else{
            myAlert("Photo album inaccessabel", "Application cannot access the photo album.")
        }
    }
}

