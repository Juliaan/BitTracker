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
    let error: ErrorResponse?
    
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
