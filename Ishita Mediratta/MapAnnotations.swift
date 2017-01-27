//
//  MapAnnotations.swift
//  Ishita Mediratta
//
//  Created by Ishita Mediratta on 29/04/16.
//  Copyright © 2016 Ishita Mediratta. All rights reserved.
//

import UIKit
import MapKit

class MapAnnotations: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    var title: String?

    
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title

    }
    

    
}
