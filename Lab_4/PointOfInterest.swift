//
//  PointOfInterest.swift
//  Lab4
//
//  Created by 黄越 on 10/20/19.
//  Copyright © 2019 黄越. All rights reserved.
//

import Foundation
import MapKit

class PointOfInterest: NSObject, MKAnnotation {
    
    let title: String?
    let locationName: String
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
    }
    
    
    var subtitle: String? {
        return locationName
    }
}
