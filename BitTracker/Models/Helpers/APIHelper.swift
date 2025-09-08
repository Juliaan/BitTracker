//
//  APIHelper.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/03.
//

import Foundation

enum APIEndpoint: String {

    case symbols = "symbols"
    case latest = "latest"
    case convert = "convert"
    case date = "{date}" // need to format date appropriately
    case timeseries = "timeseries"
    case fluctuation = "fluctuation"
    
    var urlString: String {
        //"https://data.fixer.io/api/\(self.rawValue)"
        "https://api.apilayer.com/fixer/\(self.rawValue)" // use apilayer directly
    }
}
