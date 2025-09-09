//
//  UserDefaultsHelper.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/06.
//

import Foundation

class UserDefaultsHelper {
    
    static let shared = UserDefaultsHelper()

    private init() {}

    private let baseKey = "baseCurrencySet"
    private let trackedKey = "trackedCurrencySet"
    private let allKey = "currencySet"

    func saveCurrencysets(base: Set<Currency>, tracked: Set<Currency>, all: Set<Currency>) {
        
        saveCurrencySet(base, forKey: baseKey)
        saveCurrencySet(tracked, forKey: trackedKey)
        saveCurrencySet(all, forKey: allKey)
        
    }

    func loadCurrencysets() -> (base: Set<Currency>, tracked: Set<Currency>, all: Set<Currency>) {
        
        let base = UserDefaultsHelper.loadCurrencySet(forKey: baseKey) ?? []
        let tracked = UserDefaultsHelper.loadCurrencySet(forKey: trackedKey) ?? []
        let all = UserDefaultsHelper.loadCurrencySet(forKey: allKey) ?? []
        
        return (base: base, tracked: tracked, all: all)
        
    }

    private func saveCurrencySet(_ set: Set<Currency>, forKey key: String) {
        
        if let data = try? JSONEncoder().encode(Array(set)) {
            
            UserDefaults.standard.set(data, forKey: key)
            
        }
        
    }

    static func loadCurrencySet(forKey key: String) -> Set<Currency>? {
        
        guard let data = UserDefaults.standard.data(forKey: key),
              let array = try? JSONDecoder().decode([Currency].self, from: data) else {
            
            return nil
            
        }
        
        return Set(array)
        
    }
    
}
