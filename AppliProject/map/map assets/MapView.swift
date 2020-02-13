//
//  MapView.swift
//  GC_Map
//
//  Created by Hélène Delaporte on 05/02/2020.
//  Copyright © 2020 GrowCity. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView : UIViewRepresentable {
    @Binding var landmarks: [Place]
    @Binding var selectedLandmark: LandmarkAnnotation?
    @Binding var showingPlaceDetails: Bool

    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        return map
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: 50.62925, longitude: 3.057256) //Coordonnées de Lille
        let span = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)

        view.removeAnnotations(view.annotations)
        let newAnnotations = landmarks.map { LandmarkAnnotation(place: $0) }
        view.addAnnotations(newAnnotations)
    }

    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(parent: self)
    }

}
