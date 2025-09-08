//
//  CurrencySetupView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/05.
//

import SwiftUI

struct BitcoinSetupView: View {
    
    var body: some View {
        
        ZStack {
            
            Color.flashGreen.ignoresSafeArea()
                .padding(0)
            
            NavigationStack {
                
                VStack {
                    
                    BitCoinContentView()
                    
                }
                
                Spacer()
                
            }
            
        }
        .navigationBarTitle("Bitcoin Setup", displayMode: .large)
        .navigationBarBackButtonHidden(true)
        
    }
    
}

#Preview {
    BitcoinSetupView()
}
