//
//  MapViewController.swift
//  Lab4
//
//  Created by 黄越 on 10/20/19.
//  Copyright © 2019 黄越. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
import WebKit
class MapViewController: UIViewController, CLLocationManagerDelegate, WKNavigationDelegate {
    let mapView = MKMapView.init(frame: CGRect(x: 0, y: 85, width: 500, height: 900))
    var myLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    let locationmanage = CLLocationManager()
    var somePoint = PointOfInterest(title: "Some Place 1", locationName: "Famous Place", coordinate: CLLocationCoordinate2DMake(41.890158, 12.492185))
    override func viewDidLoad() {
        super.viewDidLoad()
        locationmanage.delegate = self
        locationmanage.requestWhenInUseAuthorization()
        locationmanage.startUpdatingLocation()
        
//        print(somePoint.locationName)
//        mapView.addAnnotation(somePoint)
        //view.addSubview(mapView)
        let webview = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        let str = "https://www.google.com/maps/search/movie"
        webview.navigationDelegate = self
        let url = URL(string: str)!
        //print(myLocation)
        let myURLRequest = URLRequest(url: url)
        webview.load(myURLRequest)
        webview.allowsBackForwardNavigationGestures = true
        view.addSubview(webview)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.first {
                let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                //print(location.coordinate)
                myLocation = location.coordinate
    let region = MKCoordinateRegion(center: location.coordinate, span: span)
    mapView.setRegion(region, animated: true)
        }
    }
}
    extension ViewController : CLLocationManagerDelegate {
        private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            if status == .authorizedWhenInUse {
                manager.requestLocation()
            }
        }
        
        private func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if locations.first != nil {
                print("location:: (location)")
            }
        }
        
        private func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
            print("error:: (error)")
        }
    }


