//
//  ErrorModel.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/03.
//

import Foundation

struct ErrorResponse: Codable {
    
    let code: Int
    let type: String
    let info: String
    
}
