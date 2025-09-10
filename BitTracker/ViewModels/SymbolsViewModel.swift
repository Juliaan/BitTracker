//
//  SymbolsViewModel.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/03.
//

import Foundation
import SwiftUI

@MainActor
class SymbolsViewModel: ObservableObject {
    
    @Published var currencies: Set<Currency> = []
    @Published var baseCurrencies: Set<Currency> = []
    @Published var trackedCurrencies: Set<Currency> = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service = ServiceRequest()
    
    /*
    init() {
        //loadSymbols()
    }
    */
    
    func removeTrackedCurrency(_ currency: Currency, from: inout Set<Currency>, to: inout Set<Currency>) {
    
        from.remove(currency)
        to.insert(currency)
        
        UserDefaultsHelper.shared.saveCurrencySet(from, forKey: "trackedCurrencySet")
        UserDefaultsHelper.shared.saveCurrencySet(to, forKey: "currencySet")
        
    }
    
    func removeWorldCurrency(_ currency: Currency, from: inout Set<Currency>, to: inout Set<Currency>) {
    
        from.remove(currency)
        to.insert(currency)
        
        UserDefaultsHelper.shared.saveCurrencySet(to, forKey: "trackedCurrencySet")
        UserDefaultsHelper.shared.saveCurrencySet(from, forKey: "currencySet")
        
    }
    
    func loadSymbolsFromLocalStorage() {
        
        if let savedData = UserDefaultsHelper.shared.loadCurrencysets() {
            
            self.currencies = savedData.all
            self.baseCurrencies = savedData.base
            self.trackedCurrencies = savedData.tracked
            
            self.isLoading = false
            
        }
        
    }
    
    func loadSymbols() async {
        
        Task {
        
            DispatchQueue.main.async {
            
                self.isLoading = true
                self.errorMessage = nil
                
            }
            
            do {
            
                let result = try await service.fetchSymbols()
                
                DispatchQueue.main.async {
                
                    self.currencies = result.all!
                    self.baseCurrencies = result.base!
                    self.trackedCurrencies = result.tracked!
                    
                    UserDefaultsHelper.shared.saveCurrencysets(
                        base: result.base!,
                        tracked: result.tracked!,
                        all: result.all!
                    )
                    
                    self.isLoading = false
                    
                }
                
            } catch {
                
                DispatchQueue.main.async {
                    
                    self.errorMessage = "Failed to load symbols"
                    self.isLoading = false
                    
                }
                
            }
            
        }
        
    }
    
}
