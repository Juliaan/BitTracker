//
//  RatesModel.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/03.
//

import Foundation

struct LatestRatesResponse: Codable {
 
    let success: Bool
    let timestamp: Int
    let base: String
    let date: String
    let rates: [String: Double]?
    let error: ErrorResponse? // if there was an error we can parse the error from the API response
    
}

struct LatestRate: Codable, Hashable, Identifiable {
    
    let id: String //JE: use code as id
    var currencyCode: String { id }
    let rateValue: Double
        
    init(currencyCode: String, value: Double) {
        self.id = currencyCode
        self.rateValue = value
    }
    
}

enum SortRate {
    case currencyCode
}

/*
 Sample response:
 
 {
     "success": true,
     "timestamp": 1757357944,
     "base": "BTC",
     "date": "2025-09-08",
     "rates": {
         "ZAR": 1967622.025544,
         "USD": 112538.5,
         "AUD": 170693.917824
     }
 }
*/
