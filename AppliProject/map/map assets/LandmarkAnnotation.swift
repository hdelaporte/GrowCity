
//
//  LandmarkAnnotation.swift
//  GC_Map
//
//  Created by Hélène Delaporte on 05/02/2020.
//  Copyright © 2020 GrowCity. All rights reserved.
//

import Foundation
import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    let id: Int
    let title: String?
    let place: Place
    let annotationType: AnnotationType
    let coordinate: CLLocationCoordinate2D

    init(place: Place) {
        id = place.id
        title = place.name
        coordinate = place.location
        self.place = place
        annotationType = place.annotationType
    }
}
