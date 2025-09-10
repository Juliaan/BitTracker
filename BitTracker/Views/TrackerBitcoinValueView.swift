//
//  TrackerBitcoinValueView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/08.
//

import SwiftUI

struct TrackerBitcoinValueView: View {
    
    @State private var displayValue: String = "Loading..."
    
    var body: some View {
        HStack {
            Image(systemName: "bitcoinsign.circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.flashDarkGreen)
            Text("\(Double(displayValue) ?? 0)")
                .foregroundColor(.flashDarkGreen)
            
            Spacer()
            Image(systemName: "pencil")
                .foregroundColor(.flashDarkGreen)
            
        }
        .onAppear {
            if let savedValue = UserDefaults.standard.string(forKey: "lastEnteredAmount") {
                displayValue = savedValue
            } else {
                displayValue = "0" // default fallback
            }
        }
    }
}

#Preview {
    TrackerBitcoinValueView()
}
