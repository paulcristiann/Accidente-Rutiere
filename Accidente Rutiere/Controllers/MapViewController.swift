//
//  MapViewController.swift
//  Accidente Rutiere
//
//  Created by Paul-Cristian Vasile on 19/04/2019.
//  Copyright © 2019 Paul-Cristian Vasile. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol MapDelegate {
    func mapDataChanged(latitude: Double, longitude: Double)
}

class customPin: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(pinTitle:String, location: CLLocationCoordinate2D){
        self.title = pinTitle
        self.coordinate = location
    }
    
}

class MapViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var coordonate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var delegate: MapDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(triggerTouchAction))
        mapView.addGestureRecognizer(gestureRecognizer)
        
        mapView.showsUserLocation = true
        if CLLocationManager.locationServicesEnabled() == true {
            
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied ||  CLLocationManager.authorizationStatus() == .notDetermined {
                locationManager.requestWhenInUseAuthorization()
            }
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            
        } else {
            print("PLease turn on location services or GPS")
        }
    }
    
    @objc func triggerTouchAction(gestureReconizer: UITapGestureRecognizer) {
       
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
        let touchLocation = gestureReconizer.location(in: mapView)
        let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
        print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
        
        let pin = customPin(pinTitle: "Locul incidentului", location: CLLocationCoordinate2D(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude))
        
        coordonate.latitude = locationCoordinate.latitude
        coordonate.longitude = locationCoordinate.longitude
        
        self.mapView.addAnnotation(pin)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        self.mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to access your current location")
    }
    
    @IBAction func backPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func savePressed(_ sender: Any) {

        if(coordonate.latitude != 0 && coordonate.longitude != 0){

            delegate?.mapDataChanged(latitude: coordonate.latitude, longitude: coordonate.longitude)
            dismiss(animated: true, completion: nil)

        }

    }

}


