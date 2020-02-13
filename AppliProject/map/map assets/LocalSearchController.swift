//
//  LocalSearchController.swift
//  GC_Map
//
//  Created by Hélène Delaporte on 05/02/2020.
//  Copyright © 2020 GrowCity. All rights reserved.
//

import Foundation
import MapKit

final class LocalSearchController: NSObject, MKLocalSearchCompleterDelegate {

    private var searchCompleter = MKLocalSearchCompleter()
    var completion: (([MKLocalSearchCompletion]) -> Void)?

    override init() {
        super.init()
        searchCompleter.delegate = self
    }

    func search(text: String, completion: @escaping ([MKLocalSearchCompletion]) -> Void) {
        self.completion = completion
        searchCompleter.queryFragment = text
    }

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        completion?(completer.results)
    }

}
