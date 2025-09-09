//
//  CurrencySetupView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/05.
//

import SwiftUI

struct CurrencySetupView: View {
    
    @ObservedObject private var viewModel = SymbolsViewModel()
    @State private var editing: Bool = false
    @State private var showBackButton: Bool = false
    
    init(editing: Bool = false, showBackButton: Bool = false) {
        _editing = State(initialValue: editing)
        _showBackButton = State(initialValue: showBackButton)
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                if viewModel.isLoading {
                    FeedbackView(title: "...loading...")
                } else {
                    
                    VStack {
                        
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
                        .background(Color.flashGreen)
                        .refreshable {
                            await viewModel.loadSymbols()
                        }
                        
                        if !editing {
                        
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
                                .cornerRadius(12)
                                .ignoresSafeArea()
                                
                            }
                            .padding()
                            .background(Color.flashDarkGreen)
                            .ignoresSafeArea()
                            
                        }
                        
                        //Spacer()
                        
                    }
                    
                }
                
            }
            .onAppear() {
                Task {
                    await viewModel.loadSymbols()
                }
                
            }
            .alert(isPresented: Binding<Bool>(
                get: { viewModel.errorMessage != nil },
                set: { _ in viewModel.errorMessage = nil }
            )) {
                Alert(
                    title: Text("Oops"),
                    message: Text("Looks like we encountered an error."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .navigationBarTitle(!editing ? "Currency Setup" : "Edit Currencies", displayMode: .large)
            .navigationBarBackButtonHidden(!showBackButton)
            .navigationBarTitleDisplayMode(.automatic)
            
        }
        
    }
    
}

#Preview {
    CurrencySetupView()
}
