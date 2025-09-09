//
//  SymbolRowView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/08.
//

import SwiftUI

struct SymbolRowView: View {
    
    @ObservedObject private var viewModel = RateViewModel()
    
    var symbolCode: String = ""
    var rowTitle: String = ""
    var rowSubTitle: String = ""
    var isUp: Bool = false
    
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
                    
                    if isUp {
                        Image(systemName: "arrow.up")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "arrow.down")
                            .foregroundColor(.red)
                    }
                    
                    Text("BTC-\(viewModel.rateResult.id)")
                        .bold()
                                        
                    Spacer()
                    
                    Text("\(String(format: "%.2f", viewModel.rateResult.rateValue))")
                        .bold()
                    
                    Text("- 0.25%")
                        .bold()
                        .foregroundColor(isUp ? .flashGreen : .red)
                    
                }
                
                HStack {
                    
                    Text(" ")
                        .foregroundColor(.gray)
                    Spacer()
                    
                }
                
                HStack {
                    
                    Text("1 Bitcoin = \(String(format: "%.2f", viewModel.rateResult.rateValue)) (\(viewModel.rateResult.id))")
                        .foregroundColor(.gray)

                    Spacer()
                    
                }
                
            } else {
                
                FeedbackView(title: "...loading...")
                
            }
            
        }
        .onAppear {
            
            Task {
                await viewModel.loadRateFor(symbol: symbolCode)
            }
                
        }
        
    }
}

#Preview {
    SymbolRowView()
}
