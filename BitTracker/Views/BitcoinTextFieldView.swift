//
//  BitcoinTextFieldView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/06.
//

import SwiftUI

struct BitCoinContentView: View {
    
    @State private var amount: Double = 0.0
    @State private var editMode: Bool = false
    @State private var showBackButton: Bool = false
    
    init(editing: Bool = false, showBackButton: Bool = false) {
        _editMode = State(initialValue: editing)
        _showBackButton = State(initialValue: showBackButton)
    }
    
    var body: some View {
        
        VStack {
            
            Text("Please enter the amount of Bitcoin that you own.")
                .foregroundColor(.white)
                .padding(.top, 20)
            
            BitcoinTextFieldView(value: $amount, isEditing: $editMode)
            
            if !editMode {
                
                Text("Your base currency is Bitcoin (BTC). You'll see trends against ZAR, USD, and AUD. You can change these in settings anytime.")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .italic()
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                
            }
            
            
        }
        .background(Color.flashGreen)
        
    }
}

struct BitcoinTextFieldView: View {
    
    @Binding var value: Double
    @Binding var isEditing: Bool
    
    @State private var text: String = ""
    @State private var navigateToCurrencySetup = false //JE: Navigation state variable
    
    let userDefaultsKey = "lastEnteredAmount"
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        HStack {
            
            Image(systemName: "bitcoinsign.circle")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.white)
            
            TextField("Enter amount", text: $text)
                .frame(height: 38.0)
                .keyboardType(.decimalPad)
                .focused($isTextFieldFocused)
                .onChange(of: text) {
                    let formatText = text.replacingOccurrences(of: ",", with: ".")
                    if let doubleValue = Double(formatText) {
                        value = doubleValue
                    }
                }
                .foregroundColor(.white)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            
                            hideKeyboard()
                            
                            if !isEditing {
                                navigateToCurrencySetup = true
                            }
                            
                            
                            // Save to UserDefaults when done
                            UserDefaults.standard.set(value, forKey: userDefaultsKey)
                            
                        }
                    }
                }
                .onAppear {
                    
                    // Initialize text with the current value
                    // Retrieve last value from UserDefaults or fallback to current value
                    if let savedValue = UserDefaults.standard.value(forKey: userDefaultsKey) as? Double {
                        
                        value = savedValue
                        
                        self.text = String(savedValue)
                        
                    }
                    
                    //JE: Give the TextField focus, even if we have no saved value from previous sessions.
                    DispatchQueue.main.async {
                        self.isTextFieldFocused = true
                    }
                    
                }
            
        }
        .padding() // Optional padding inside the border
        .background(
            
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.white.opacity(1), lineWidth: 1)
            
        )
        .navigationDestination(isPresented: $navigateToCurrencySetup) {
            CurrencySetupView()
        }
        .padding()
    }
    
}

//JE: UIKit Helper to dismiss keyboard when Done is tapped...
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

#Preview {
    BitCoinContentView()
}
