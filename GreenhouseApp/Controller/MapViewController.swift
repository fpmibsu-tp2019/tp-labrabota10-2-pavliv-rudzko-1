//
//  MapViewController.swift
//  GreenhouseApp
//
//  Created by Elizaveta on 6/2/19.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var infoLabel: UILabel!
    
    let locationManager = CLLocationManager()
    let initialLocation = CLLocation(latitude: 53.9 , longitude: 27.56659)
    let regionRadius: CLLocationDistance = 20000
    
    func centerMapOnLocation(location: CLLocation)
    {
        locationManager.delegate = self
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerMapOnLocation(location: initialLocation)
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(_:)))
        mapView.addGestureRecognizer(gestureRecognizer)
        mapView.showsUserLocation = true
        enableLocationServices()
        escalateLocationServiceAuthorization()
        
        mapView.addAnnotation(GreenhouseAnnotation(title: "Branch office 1", coordinate: CLLocationCoordinate2D(latitude: 53.867378, longitude: 27.597416)))
        
        mapView.addAnnotation(GreenhouseAnnotation(title: "Branch office 2", coordinate: CLLocationCoordinate2D(latitude: 53.868128, longitude: 27.477901)))
        
        mapView.addAnnotation(GreenhouseAnnotation(title: "Branch office 3", coordinate: CLLocationCoordinate2D(latitude: 53.934000, longitude: 27.530893)))
    }
    
    func enableLocationServices() {
        locationManager.delegate = self
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
            
        case .restricted, .denied:
            break
            
        case .authorizedWhenInUse:
            break
            
        case .authorizedAlways:
            break
        }
    }
    
    func escalateLocationServiceAuthorization() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        if let annotationTitle = view.annotation?.title
        {
            infoLabel.text = "User tapped on annotation with title: \(annotationTitle!)"
        }
    }
    
    @objc func handleLongPressGesture(_ gestureReconizer: UILongPressGestureRecognizer){
        let point = gestureReconizer.location(in: mapView)
        let coordinate = mapView.convert(point,toCoordinateFrom: mapView)
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        getPlacemarkFromLocation(location: location, coordinate: coordinate)
    }
    
    func getPlacemarkFromLocation(location: CLLocation, coordinate: CLLocationCoordinate2D){
        CLGeocoder().reverseGeocodeLocation(location, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("Reverse geodcode fail: \(error!.localizedDescription)")
                }
                for placemark in placemarks!
                {
                    if let city =  placemark.locality
                    {
                        self.setAnnotationToMap(title: city, coordinate:coordinate)
                    }
                }
        })
    }
    
    func setAnnotationToMap(title: String, coordinate: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        //mapView.removeAnnotation(annotation)
        annotation.title = title
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        infoLabel.text = title
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
