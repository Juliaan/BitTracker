//
//  CurrencySetupView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/05.
//

import SwiftUI

struct CurrencySetupView: View {
    
    @ObservedObject private var viewModel = SymbolsViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                if viewModel.isLoading {
                    FeedbackView(title: "...loading...")
                } else {
                    
                    VStack {
                        
                        //Text("Pull down to refresh")
                        //        .font(.footnote)
                        //        .foregroundColor(.gray)
                        //        .padding()
                        List {
                            
                            if !viewModel.baseCurrencies.isEmpty {
                            
                                Section(header: Text("Base Currency")) {
                                    ForEach(viewModel.baseCurrencies.sorted(by: { $0.name < $1.name })) { currency in
                                        CurrencyListCellView(currency: currency)
                                    }
                                }
                                
                            }
                            
                            if !viewModel.trackedCurrencies.isEmpty {
                            
                                Section(header: Text("Tracked Currencies")) {
                                    ForEach(viewModel.trackedCurrencies.sorted(by: { $0.name < $1.name })) { currency in
                                        CurrencyListCellView(currency: currency)
                                    }
                                }
                                
                            }
                            
                            if !viewModel.currencies.isEmpty {
                            
                                Section(header: Text("World Currencies")) {
                                    ForEach(viewModel.currencies.sorted(by: { $0.name < $1.name })) { currency in
                                        CurrencyListCellView(currency: currency)
                                    }
                                }
                                
                            }
                            
                        }
                        .listStyle(.grouped)
                        .tint(.white)
                        .background(Color.flashGreen)
                        .refreshable {
                            await viewModel.loadSymbols()
                        }
                        
                        NavigationLink(destination: TrackerView()) {
                            HStack {
                                Text("Start tracking")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right.dotted.chevron.right")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            }
                            .padding()
                            .background(Color.flashLightGreen)
                            .cornerRadius(8)
                        }
                        .padding()
                        
                        Spacer()
                        
                    }
                    .tint(.white)
                                        
                }
                
            }
            .onAppear() {
                Task {
                    await viewModel.loadSymbols()
                }
                
            }
            .navigationBarTitle("Currency Setup", displayMode: .large)
            .navigationBarBackButtonHidden(true)
            
        }
        
        
    }
        
}

#Preview {
    CurrencySetupView()
}
