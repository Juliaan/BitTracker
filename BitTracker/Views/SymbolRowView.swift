//
//  SymbolRowView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/08.
//

import SwiftUI

struct SymbolRowView: View {
    
    @ObservedObject private var viewModel = RateViewModel()
    @ObservedObject private var fluctuationViewModel = FluctuationViewModel()
    
    var symbolCode: String = ""
    var rowTitle: String = ""
    var rowSubTitle: String = ""
    
    var isUp: Bool {
        fluctuationViewModel.fluctuationResult?.changePct ?? 0 > 0
    }
    
    @State private var bitcoinAmount: Double = 0.0
    
    var body: some View {
        
        VStack {
        
            if !viewModel.isLoading {
                
                HStack {
                    
                    Text(rowSubTitle)
                        .italic()
                        .foregroundColor(.gray)
                    Spacer()
                    
                }
                
                HStack {
                    
                    if fluctuationViewModel.isLoading {
                        Image(systemName: "progress.indicator")
                            .foregroundColor(.gray)
                            .symbolEffect(.variableColor)
                    } else {
                        
                        if isUp {
                            Image(systemName: "arrow.up")
                                .foregroundColor(.green)
                        } else {
                            Image(systemName: "arrow.down")
                                .foregroundColor(.red)
                        }
                        
                    }
                    
                    Text("BTC-\(viewModel.rateResult.id)")
                        .bold()
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("\(String(format: "%.2f", viewModel.rateResult.rateValue))")
                        .bold()
                    
                    Text("\(String(format: "%.2f", fluctuationViewModel.fluctuationResult?.changePct ?? 0))")
                        .bold()
                        .foregroundColor(isUp ? .flashGreen : .red)
                    
                }
                
                HStack {
                    
                    Text(" ")
                        .foregroundColor(.gray)
                    Spacer()
                    
                }
                
                HStack {
                    
                    Text("My Bitcoin = \(String(format: "%.2f", viewModel.rateResult.rateValue * bitcoinAmount)) (\(viewModel.rateResult.id))")
                        .foregroundColor(.gray)

                    Spacer()
                    
                }
                
            } else {
                
                FeedbackView(title: "...loading...")
                
            }
            
        }
        .onAppear {
            
            if let savedValue = UserDefaults.standard.string(forKey: "lastEnteredAmount") {
                bitcoinAmount = Double(savedValue) ?? 0
            }
            
            Task {
                
                await viewModel.loadRateFor(symbol: symbolCode)
                await fluctuationViewModel.loadFluctuationRateFor(symbol: symbolCode)
                
            }
                
        }
        
    }
    
}

#Preview {
    SymbolRowView()
}
