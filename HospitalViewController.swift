//
//  HospitalViewController.swift
//  Ishita Mediratta
//
//  Created by Ishita Mediratta on 29/04/16.
//  Copyright © 2016 Ishita Mediratta. All rights reserved.
//

import UIKit
import MapKit


class HospitalViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    let locationManager = CLLocationManager()
    
    @IBAction func searchOnValueChanged(_ sender: AnyObject) {
        
        mapView.removeAnnotations(mapView.annotations)
        
        searchInMap()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
      
        
    }
    
    
    var initialLocation: CLLocation!
    let searchRadius: CLLocationDistance = 10000
    
    
    func searchInMap() {
        // 1
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)
        // 2
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        request.region = MKCoordinateRegion(center: initialLocation.coordinate, span: span)
        // 3
        let search = MKLocalSearch(request: request)
        search.start{
            (response, error) in
            if let items = response?.mapItems
            {
                for item in items{
                    self.addPinToMapView(item.name!, latitude: item.placemark.location!.coordinate.latitude, longitude: item.placemark.location!.coordinate.longitude)
                }
            }
        }
    
    }
    
    func addPinToMapView(_ title: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let annotation = MapAnnotations(coordinate: location, title: title)
        
        mapView.addAnnotation(annotation)
    }
    
    



    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            let locValue: CLLocationCoordinate2D = (manager.location?.coordinate)!
            let long = locValue.longitude
            let lat = locValue.latitude
            print(long)
            print(lat)
            initialLocation = CLLocation(latitude: lat, longitude: long)
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, searchRadius, searchRadius)
            mapView.setRegion(coordinateRegion, animated: true)
            searchInMap()
            
            
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error)")
    }
}

