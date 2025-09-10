//
//  FluctuationModel.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/09.
//  Use a different approach for fluctuation response based on enum keys (not replacing _'s during response unwrapping)
//

import Foundation

struct FluctuationResponse: Codable {
    // note: we can handle snake_case when making request, but handling it here for now
    
    let success: Bool
    let fluctuation: Bool
    let startDate: String
    let endDate: String
    let base: String
    let rates: [String: FluctuationRateInfo]?
    
    // Map the JSON keys to Swift property names
    enum CodingKeys: String, CodingKey {
        
        case success
        case fluctuation
        case startDate = "start_date" // handle snake_case
        case endDate = "end_date" // handle snake_case
        case base
        case rates
        
    }
    
}

struct FluctuationRateInfo: Codable {
    // note: we can handle snake_case when making request, but handling it here for now
    
    let startRate: Double
    let endRate: Double
    let change: Double
    let changePct: Double
    
    enum CodingKeys: String, CodingKey {
        
        case startRate = "start_rate" // handle snake_case
        case endRate = "end_rate" // handle snake_case
        case change
        case changePct = "change_pct" // handle snake_case
        
    }
    
}

/*
 
 Sample response:
 
 {
     "success": true,
     "fluctuation": true,
     "start_date": "2025-09-08",
     "end_date": "2025-09-09",
     "base": "BTC",
     "rates": {
         "ZAR": {
             "start_rate": 1958669.588865,
             "end_rate": 1977834.529383,
             "change": 19,
             "change_pct": 0.9785
         }
     }
 }
 
 */
