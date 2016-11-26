
import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var lbLocation1: UILabel!
    @IBOutlet weak var lbLocation2: UILabel!

    let locationManager = CLLocationManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbLocation1.text = ""
        lbLocation2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goLocation(latitude latitudeValue:CLLocationDegrees, longitude logitudeValue: CLLocationDegrees, delta span:Double) -> CLLocationCoordinate2D {
        
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, logitudeValue)
        let spanValue = MKCoordinateSpanMake(span, span)
        let pRegion = MKCoordinateRegionMake(pLocation, spanValue)
        mapView.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
    
    func setAnnotation(latitude latitudeValue:CLLocationDegrees, longitude logitudeValue: CLLocationDegrees, delta span:Double, title strTitle:String, subtitle strSubtitle:String){ //핀생성
        let annotation = MKPointAnnotation();
        annotation.coordinate = goLocation(latitude: latitudeValue, longitude:logitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        
        let latitude:String = String((pLocation?.coordinate.latitude)!)
        let longitude:String = String((pLocation?.coordinate.longitude)!)
        
        goLocation(latitude: (pLocation?.coordinate.latitude)!, longitude: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        //주소정보 가져오기
        CLGeocoder().reverseGeocodeLocation(pLocation!,completionHandler: {
            (placemarks, error) -> Void in
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
            
            self.lbLocation1.text = "현재위치"
            self.lbLocation2.text = address+"("+latitude+", "+longitude+")"
        })
        
        manager.stopUpdatingLocation()
    }
    
    @IBAction func changeSegments(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            self.lbLocation1.text = ""
            self.lbLocation2.text = ""
            locationManager.startUpdatingLocation()
        case 1:
            setAnnotation(latitude: 37.1408211, longitude: 127.64977750000003, delta: 0.1, title: "강동대학교", subtitle: "충북 음성군 감곡면 대학길 278")
            self.lbLocation1.text = "보고 계신 위치"
            self.lbLocation2.text = "강동대학교"
            
        case 2:
            setAnnotation(latitude: 37.5307871, longitude: 126.8981, delta: 0.1, title: "이지퍼블리싱", subtitle: "서울시 영등포구 당산로 41길 11")
            self.lbLocation1.text = "보고 계신 위치"
            self.lbLocation2.text = "이지퍼블리싱 출판사"
        case 3:
            setAnnotation(latitude: 37.682192, longitude: 126.765073, delta: 0.1, title: "내가 사는 집", subtitle: "고양시 일산서구 일산3동 후곡로 55")
            self.lbLocation1.text = "보고 계신 위치"
            self.lbLocation2.text = "내가 사는 집"
        default:
            break;
        }
    }


}

