
//
//  PinMKAnnotationView.swift
//  GC_Map
//
//  Created by Hélène Delaporte on 05/02/2020.
//  Copyright © 2020 GrowCity. All rights reserved.
//

import MapKit

final class PinMKAnnotationView: MKAnnotationView {

    private var imageView: UIImageView!

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        canShowCallout = true
        frame = CGRect(x: 0, y: 0, width: 30, height: 30)

        imageView = UIImageView(image: UIImage(named: "Pin"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = self.bounds
        addSubview(self.imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
