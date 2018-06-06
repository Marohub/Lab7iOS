//
//  RoadViewController.swift
//  Lab6iOS
//
//  Created by Marek Kozłowski on 29/05/2018.
//  Copyright © 2018 Marek Kozłowski. All rights reserved.
//

import Foundation
import MapKit

protocol RoadDetailDelegate {
    func createRoad(road:Road)
}
class RoadViewController: UIViewController {
    var delegate:RoadDetailDelegate?
    var roads = [Road]()

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        
        table.delegate=self
        table.dataSource = self
    }
    
}
