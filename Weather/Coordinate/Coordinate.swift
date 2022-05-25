import Foundation
import CoreLocation
import MapKit

class Coordinate : NSObject , ObservableObject , CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(
        center:  CLLocationCoordinate2D(
          latitude: 37.789467,
          longitude:-122.416772
        ),
        span: MKCoordinateSpan(
          latitudeDelta: 0.5,
          longitudeDelta: 0.5
       )
    )
    var sendCountry = "United Kingdom"
    private let manager = CLLocationManager()
    override init(){
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        if manager.authorizationStatus == .authorizedWhenInUse{
            manager.startUpdatingLocation()
        }else{
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let coordinateRegion = MKCoordinateRegion(center: locations.last!.coordinate, span: span)
        getAdress(cllocation: coordinateRegion.center ){getC in
            print("location manager \(getC)")
            
        }
        region = coordinateRegion
    }
    
    func getAdress(cllocation : CLLocationCoordinate2D , _ completion : @escaping (String) -> Void){
        let loc = CLLocation(latitude: cllocation.latitude, longitude: cllocation.longitude)
        let clgeo = CLGeocoder()
        clgeo.reverseGeocodeLocation(loc) { placemarks , error in
            //self.sendCountry = placemarks?.first?.country ?? "United States"
            completion(placemarks?.first?.country ?? "United Kingdom")
        }
        
    }
}
