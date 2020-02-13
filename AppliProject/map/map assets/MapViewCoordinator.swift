//
//  MapViewCoordinator.swift
//  GC_Map
//
//  Created by Hélène Delaporte on 05/02/2020.
//  Copyright © 2020 GrowCity. All rights reserved.
//

import MapKit

final class MapViewCoordinator: NSObject, MKMapViewDelegate {
    private var parent: MapView

    init(parent: MapView) {
        self.parent = parent
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotationType = (annotation as? LandmarkAnnotation)?.annotationType else {
            preconditionFailure("Invalid annotation model")
        }

        let identifier = annotationType.rawValue
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = makeAnnotation(annotation, annotationType: annotationType, reuseIdentifier: identifier)
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }

    private func makeAnnotation(_ annotation: MKAnnotation, annotationType: AnnotationType, reuseIdentifier: String) -> MKAnnotationView {
        let annotationView: MKAnnotationView
        switch annotationType {
        case .pin:
            annotationView = PinMKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
        case .nativePin:
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
        }
        annotationView.canShowCallout = true
        annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let placemark = view.annotation as? LandmarkAnnotation else {
            return
        }

        parent.selectedLandmark = placemark
        parent.showingPlaceDetails = true
    }

}

