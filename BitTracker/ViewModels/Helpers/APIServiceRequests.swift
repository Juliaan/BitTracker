//
//  APIServiceRequests.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/03.
//

import Foundation

class ServiceRequest {
    
    private var apiKey: String? {
        return KeychainHelper.shared.retrieveAPIKey()
    }
    
    func fetchSymbols() async throws -> (base: Set<Currency>?, tracked: Set<Currency>?, all: Set<Currency>?) {
        
        var urlComponents = URLComponents(string: APIEndpoint.symbols.urlString)!
        //urlComponents.queryItems = [
        //    URLQueryItem(name: "access_key", value: apiKey)
        //]
        
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        // No need to set the API key in headers anymore
        request.setValue(self.apiKey, forHTTPHeaderField: "apikey")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            if !(200...299).contains(httpResponse.statusCode) {
                print("HTTP Error: \(httpResponse.statusCode)")
                throw URLError(.badServerResponse)
            }
        }
        do {
            let decodedResponse = try JSONDecoder().decode(SymbolsResponse.self, from: data)
            if decodedResponse.success, let symbols = decodedResponse.symbols {
                
                // create a more readable return object for views
                var baseSet = Set<Currency>()
                var trackedSet = Set<Currency>()
                var allSet = Set<Currency>()
                
                for (code, name) in symbols {
                    let currency = Currency(code: code, name: name)
                    
                    if code == "BTC" {
                        baseSet.insert(currency)
                    } else if ["ZAR", "USD", "AUD"].contains(code) {
                        trackedSet.insert(currency)
                    } else {
                        allSet.insert(currency)
                    }
                    
                }
                
                return (base: baseSet, tracked: trackedSet, all: allSet)
                
            } else {
                print("API response unsuccessful or missing symbols")
                throw URLError(.badServerResponse)
            }
        } catch {
            print("Decoding Error: \(error)")
            throw error
        }
        
    }
    
    func fetchLatestRateFor(symbol: String) async throws -> (LatestRate) {
        
        var urlComponents = URLComponents(string: APIEndpoint.latest.urlString)!
        urlComponents.queryItems = [
            URLQueryItem(name: "symbols", value: symbol)
        ]
        
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        // No need to set the API key in headers anymore
        request.setValue(self.apiKey, forHTTPHeaderField: "apikey")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            if !(200...299).contains(httpResponse.statusCode) {
                print("HTTP Error: \(httpResponse.statusCode)")
                throw URLError(.badServerResponse)
            }
        }
        do {
            
            let decodedResponse = try JSONDecoder().decode(LatestRatesResponse.self, from: data)
            
            if decodedResponse.success,
                let rates = decodedResponse.rates {
                var rate: LatestRate!
                
                for (code, value) in rates {
                    rate = LatestRate(currencyCode: code, value: value)
                }
                
                return (rate)
                
            } else {
                print("API response unsuccessful or missing symbols")
                throw URLError(.badServerResponse)
            }
        } catch {
            print("Decoding Error: \(error)")
            throw error
        }
        
    }
    
}




