//
//  ViewController.swift
//  Lab6iOS
//
//  Created by Marek Kozłowski on 29/05/2018.
//  Copyright © 2018 Marek Kozłowski. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var myInitLocation = CLLocationCoordinate2D(latitude: 54.3520, longitude: 18.6466)
    var data = [Road]()

    @IBAction func Button(_ sender: UIButton) {
        performSegue(withIdentifier: "goToRoadView", sender: data)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let region = MKCoordinateRegion(center: myInitLocation, span: span)
       mapView.setRegion(region, animated: true)
        mapView.delegate = self
        createPolyline()
      
//        request.requestsAlternateRoutes = true
        
        appendToData(startlatitude: 54.354331916, startlongitude: 18.63999744, endlatitude: 54.444092, endlongitude: 18.570328, roadStartPoint: "Gdansk", roadDestination: "Sopot")
        appendToData(startlatitude: 54.354331916, startlongitude: 18.63999744, endlatitude: 54.52130 ,endlongitude: 18.52960, roadStartPoint: "Gdansk", roadDestination: "Gdynia")
        appendToData(startlatitude: 54.37153, startlongitude: 18.61913, endlatitude: 54.40373 ,endlongitude: 18.60774, roadStartPoint: "University of Technology", roadDestination: "Football stadium")
        
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor=UIColor.blue
        return renderer
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func appendToData(startlatitude: CLLocationDegrees, startlongitude: CLLocationDegrees,endlatitude: CLLocationDegrees, endlongitude: CLLocationDegrees, roadStartPoint: String, roadDestination: String ){
        let request = MKDirectionsRequest()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: startlatitude, longitude: startlongitude)))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: endlatitude, longitude: endlongitude)))
        request.transportType = .automobile
        let directions = MKDirections(request: request)
         data.append(Road(roadStartPoint: roadStartPoint, roadDestination: roadDestination,direction: directions))
    }
    func createPolyline() {
        let locations = [CLLocationCoordinate2D(latitude: 54.371273, longitude: 18.61236),
                         CLLocationCoordinate2D(latitude: 54.371325, longitude: 18.612737),
                         CLLocationCoordinate2D(latitude: 54.371545, longitude: 18.612651),
                         CLLocationCoordinate2D(latitude: 54.371701, longitude: 18.612735),
                         CLLocationCoordinate2D(latitude: 54.371853, longitude: 18.613015),
                         CLLocationCoordinate2D(latitude: 54.37202, longitude: 18.612748),
                         CLLocationCoordinate2D(latitude: 54.37187, longitude: 18.612474),
                         CLLocationCoordinate2D(latitude: 54.371832, longitude: 18.612199),
                         CLLocationCoordinate2D(latitude: 54.371898, longitude: 18.611826),
                         CLLocationCoordinate2D(latitude: 54.371679, longitude: 18.611709),
                         CLLocationCoordinate2D(latitude: 54.371614, longitude: 18.612073),
                         CLLocationCoordinate2D(latitude: 54.371484, longitude: 18.612277),
                         CLLocationCoordinate2D(latitude: 54.371273, longitude: 18.61236)]
        let aPolyline = MKPolyline(coordinates: locations, count: locations.count)
        mapView.add(aPolyline)
    }


}

