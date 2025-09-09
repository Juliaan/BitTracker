//
//  FluctuationViewModel.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/09.
//

import Foundation
import SwiftUI

@MainActor
class FluctuationViewModel: ObservableObject {
    
    @Published var fluctuationResult: FluctuationRateInfo? = nil
    @Published var isLoading = true
    @Published var errorMessage: String?
    
    private let service = ServiceRequest()
    
    func loadFluctuationRateFor(symbol: String) async {
        
        Task {
        
            DispatchQueue.main.async {
            
                self.isLoading = true
                self.errorMessage = nil
                
            }
            
            do {
            
                let result = try await service.fetchFluctuationFor(symbol: symbol)
                
                DispatchQueue.main.async {
                
                    self.fluctuationResult = result
                    
                    self.isLoading = false
                    
                }
                
            } catch {
                
                DispatchQueue.main.async {
                    
                    self.errorMessage = "Failed to load fluctuation data"
                    self.isLoading = false
                    
                }
                
            }
            
        }
        
    }
    
}
