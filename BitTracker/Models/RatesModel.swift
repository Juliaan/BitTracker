//
//  RatesModel.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/03.
//

import Foundation

struct RatesResponse: Codable {
 
    let success: Bool
    let rates: [String: Double]
    
}
