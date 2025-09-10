//
//  TrackerView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/06.
//

import SwiftUI

struct TrackerView: View {
    
    @State private var navigateToCurrencies = false
    @State private var navigateToBitcoinValue = false
    
    @State private var amount: Double = 0.0
    @State private var trackedSet = Set<Currency>()
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color.flashLightGreen.ignoresSafeArea()
                
                List {
                    
                    Section(header: Text("my bitcoin")) {
                        TrackerBitcoinValueView()
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                        // Remove default row background
                            .listRowBackground(Color.clear)
                            .onTapGesture {
                                navigateToBitcoinValue = true
                            }
                    }
                    .bold()
                    .foregroundColor(.white)
                    
                    Section(header: Text("my currencies")) {
                        
                        ForEach(trackedSet.sorted(by: { $0.id < $1.id })) { currency in
                            SymbolRowView(symbolCode: currency.code, rowSubTitle: currency.name)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .listRowBackground(Color.clear)
                            
                        }
                        
                    }
                    .bold()
                    .foregroundColor(.white)
                    
                    
                }
                .listStyle(.grouped)
                .background(Color.flashGreen)
                .scrollContentBackground(.hidden) // For iOS 16+, to hide default background
                .background(Color.clear)
                .onAppear {
                    
                    navigateToBitcoinValue = false
                    navigateToCurrencies = false
                    
                    UITableView.appearance().separatorStyle = .none
                    
                    if let savedTrackedSet = UserDefaultsHelper.loadCurrencySet(forKey: "trackedCurrencySet") {
                        trackedSet = savedTrackedSet
                    }
                    
                    UserDefaultsHelper.shared.saveDidCompleteSetup(true)
                    
                }
                //.refreshable {
                //    //await viewModel.loadSymbols()
                //}
                
            }
            .navigationBarTitle("BitTracker", displayMode: .large)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Handle settings action here
                        navigateToCurrencies = true

                    }) {
                        Image(systemName: "arrow.forward.circle.dotted")
                            .foregroundColor(.white)
                    }
                }
            }
            
        }
        .navigationDestination(isPresented: $navigateToCurrencies) {
            CurrencySetupView(editing: true, showBackButton: true)
        }
        .navigationDestination(isPresented: $navigateToBitcoinValue) {
            //CurrencySetupView(editing: true, showBackButton: true)
            BitcoinSetupView(editing: true, showBackButton: true)
        }
        
    }
    
}

#Preview {
    TrackerView()
}
