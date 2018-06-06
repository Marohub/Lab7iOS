//
//  ViewControllerExtenstion.swift
//  Lab6iOS
//
//  Created by Marek Kozłowski on 05/06/2018.
//  Copyright © 2018 Marek Kozłowski. All rights reserved.
//

import UIKit
import Foundation


extension RoadViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*
         This method must return the number of cells in the table view. In this case, it should return the number of elements in the array containing Student objects.
         */
        return roads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*This method must return a cell filled with proper data.*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoadCell", for: indexPath) as! RoadCell
        let road = roads[indexPath.row]
        cell.roadStartCell.text = road.roadStartPoint
        cell.roadDestinationCell.text = road.roadDestination
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let road_Cell = roads[indexPath.row]
        self.delegate?.createRoad(road: road_Cell)
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    
}
