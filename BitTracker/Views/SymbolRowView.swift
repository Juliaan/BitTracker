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
                
                Text(rowTitle)
                    .bold()
                                    
                Spacer()
                
                Text("1966620.860837")
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
                
                Text("1 Bitcoin = 1966620.860837 (ZAR)")
                    .foregroundColor(.gray)
                Spacer()
                
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
