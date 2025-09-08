//
//  SymbolsModel.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/03.
//

import Foundation

struct SymbolsResponse: Codable {
    
    let success: Bool
    let symbols: [String: String]?
    let error: ErrorResponse? // if there was an error we can parse the error from the API response
    
}

struct Currency: Codable, Hashable, Identifiable {
    
    let id: String //JE: use code as id
    var code: String { id }
    let name: String
        
    init(code: String, name: String) {
        self.id = code
        self.name = name
    }
    
}

enum SortCriteria {
    case code
    case name
}

/*
 Sample response:
 
 {
     "success": true,
     "symbols": {
         "AED": "United Arab Emirates Dirham",
         "AFN": "Afghan Afghani",
         "ALL": "Albanian Lek",
         "AMD": "Armenian Dram",
         {...}
     }
 }
 
 */
