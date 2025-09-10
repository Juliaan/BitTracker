//
//  CurrencySetupView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/05.
//

import SwiftUI

struct BitcoinSetupView: View {
    
    @State private var editing: Bool = false
    @State private var showBackButton: Bool = false
    
    init(editing: Bool = false, showBackButton: Bool = false) {
        _editing = State(initialValue: editing)
        _showBackButton = State(initialValue: showBackButton)
    }
    
    var body: some View {
        
        ZStack {
            
            Color.flashGreen.ignoresSafeArea()
                .padding(0)
            
            NavigationStack {
                
                VStack {
                    
                    BitCoinContentView(editing: editing, showBackButton: showBackButton)
                    
                }
                
                Spacer()
                
            }
            
        }
        .navigationBarTitle(editing ? "Edit Bitcoin" : "Bitcoin Setup", displayMode: .large)
        .navigationBarBackButtonHidden(!showBackButton)
        
    }
    
}

#Preview {
    BitcoinSetupView()
}
