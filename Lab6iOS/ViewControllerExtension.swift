//
//  ViewControllerExtension.swift
//  Lab6iOS
//
//  Created by Marek Kozłowski on 05/06/2018.
//  Copyright © 2018 Marek Kozłowski. All rights reserved.
//

import Foundation
import UIKit
import MapKit
extension ViewController: RoadDetailDelegate{
    func createRoad(road: Road) {
        mapView.removeOverlays(mapView.overlays)
        road.direction.calculate { [unowned self] response, error in guard let unwrappedResponse = response else { return}
            for route in unwrappedResponse.routes{
                self.mapView.add(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRoadView" {
            if let detailVC = segue.destination as? RoadViewController {
                detailVC.delegate = self
                detailVC.roads = (sender as? [Road])!
            }
        }
    }
    
    /*
     Create protocol in ChildViewController
     Create delegate variable in ChildViewController
     Extend ChildViewController protocol in MainViewController
     Give reference to ChildViewController of MainViewController when navigate
     Define delegate Method in MainViewController
     Then you can call delegate method from ChildViewController
     */
}
