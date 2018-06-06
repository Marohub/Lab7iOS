//
//  Road.swift
//  Lab6iOS
//
//  Created by Marek Kozłowski on 05/06/2018.
//  Copyright © 2018 Marek Kozłowski. All rights reserved.
//

import Foundation

import MapKit
class Road{
    var roadStartPoint:String
    var roadDestination:String
    var direction:MKDirections
    
    init(roadStartPoint: String, roadDestination: String, direction:MKDirections){
        self.roadStartPoint = roadStartPoint
        self.roadDestination = roadDestination
        self.direction = direction
    }
    
}
