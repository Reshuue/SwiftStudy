//
//  ViewController.swift
//  MapView
//
//  Created by vnenise on 2016. 11. 15..
//  Copyright © 2016년 vnenise. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var lblLocation1: UILabel!
    @IBOutlet weak var lblLocation2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblLocation1.text = ""
        lblLocation2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }

    func goLocation(latitude latitudeValue:CLLocationDegrees, longitude longitudeValue: CLLocationDegrees, delta span:Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpanMake(span, span)
        let pRegion = MKCoordinateRegionMake(pLocation, spanValue)
        mapView.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
    func setAnnotation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue:CLLocationDegrees, delta span:Double, title strTitle:String, subtitle strSubtitle:String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitude: latitudeValue, longitude: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        
        //지도 이동
        goLocation(latitude: (pLocation?.coordinate.latitude)!, longitude: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        //주소정보 가져오기
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error)-> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address+=" "
                address+=pm!.locality!
            }
            if pm!.thoroughfare != nil{
                address+=" "
                address+=pm!.thoroughfare!
            }
            self.lblLocation1.text = "현재위치"
            self.lblLocation2.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.lblLocation1.text = ""
            self.lblLocation2.text = ""
            locationManager.startUpdatingLocation()
        case 1:
            setAnnotation(latitude: 37.1408211, longitude: 127.64977750000003, delta: 0.1, title: "강동대학교", subtitle: "충북 음성군 감곡면 대학길 278")
            self.lblLocation1.text = "보고 계신 위치"
            self.lblLocation2.text = "강동대학교"
        default:
            setAnnotation(latitude: 37.5307871, longitude: 126.8981, delta: 0.1, title: "이지퍼블리싱", subtitle: "서울시 영등포구 당산로 41길 11")
            self.lblLocation1.text = "보고 계신 위치"
            self.lblLocation2.text = "이지퍼블리싱 출판사"
        }
            
    }
}

