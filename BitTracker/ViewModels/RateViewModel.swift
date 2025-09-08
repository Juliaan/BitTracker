//
//  RateViewModel.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/08.
//

import Foundation
import SwiftUI

@MainActor
class RateViewModel: ObservableObject {
    
    @Published var rateResult = LatestRate(currencyCode: "", value: 0.0)
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var searchString: String = ""

    private let service = ServiceRequest()
    
    /*
    init() {
        loadRateFor()
    }
    */
    
    func loadRateFor(symbol: String) async {
        
        Task {
        
            DispatchQueue.main.async {
            
                self.isLoading = true
                self.errorMessage = nil
                
            }
            
            do {
            
                let result = try await service.fetchLatestRateFor(symbol: symbol)
                
                DispatchQueue.main.async {
                
                    self.rateResult = result
                    
                    self.isLoading = false
                    
                }
                
            } catch {
                
                DispatchQueue.main.async {
                    
                    self.errorMessage = "Failed to load rate"
                    self.isLoading = false
                    
                }
                
            }
            
        }
        
    }
    
}
