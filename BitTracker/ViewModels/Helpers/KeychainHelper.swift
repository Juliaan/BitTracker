//
//  KeychainHelper.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/05.
//

import Foundation
import Security

class KeychainHelper {
    
    static let shared = KeychainHelper()
    private init() {}

    func saveAPIKey(_ key: String, service: String = "com.juliaanevenwel.BitTracker", account: String = "APIKey") -> Bool {
        guard let data = key.data(using: .utf8) else { return false }

        // JE: Create query for adding data to Keychain
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: data
        ]

        // JE: Delete existing item if any
        SecItemDelete(query as CFDictionary)

        // JE: Add new item to Keychain
        let status = SecItemAdd(query as CFDictionary, nil)
        
        return status == errSecSuccess
        
    }

    func retrieveAPIKey(service: String = "com.juliaanevenwel.BitTracker", account: String = "APIKey") -> String? {
        
        // JE: query to search for the APIKey item in our keychain ...
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        if status == errSecSuccess, let data = item as? Data, let key = String(data: data, encoding: .utf8) {
            return key
        }
        
        return nil
        
    }
    
}
