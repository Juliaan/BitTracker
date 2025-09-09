//
//  TrackerView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/06.
//

import SwiftUI

struct TrackerView: View {
    
    @State private var homeState: Bool = true
    @State private var amount: Double = 0.0
    @State private var trackedSet = Set<Currency>()
    
    var body: some View {
        
        NavigationStack {
            
            if homeState {
                
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
                        }
                        
                        Section(header: Text("my symbols")) {
                            
                            ForEach(trackedSet.sorted(by: { $0.id < $1.id })) { currency in
                                SymbolRowView(symbolCode: currency.code, rowSubTitle: currency.name)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .listRowBackground(Color.clear)
                            }
                            //SymbolRowView(symbolCode: "ZAR")
                            //SymbolRowView(rowTitle: "BTC-ZAR", rowSubTitle: "South African Rand")
                                
                            
                        }
                        
                        
                    }
                    .listStyle(.grouped)
                    .tint(.white)
                    .background(Color.flashGreen)
                    .scrollContentBackground(.hidden) // For iOS 16+, to hide default background
                    .background(Color.clear)
                    .onAppear {
                        
                        UITableView.appearance().separatorStyle = .none
                        
                        if let savedTrackedSet = UserDefaultsHelper.loadCurrencySet(forKey: "trackedCurrencySet") {
                            trackedSet = savedTrackedSet
                        }
                        
                    }
                    //.refreshable {
                    //    //await viewModel.loadSymbols()
                    //}
                    
                }
                .navigationBarTitle("Home", displayMode: .large)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Handle settings action here
                            homeState = false
                        }) {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(.white)
                        }
                    }
                }
                
            } else {
                
                ZStack {
                    
                    Color.flashLightGreen.ignoresSafeArea()
                    
                }
                .navigationBarTitle("Setup", displayMode: .large)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Handle settings action here
                            homeState = true
                        }) {
                            Image(systemName: "house.circle.fill")
                                .foregroundColor(.white)
                        }
                    }
                }
                
            }
            
        }
        
    }
    
}

#Preview {
    TrackerView()
}
