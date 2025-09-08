//
//  TrackerView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/06.
//

import SwiftUI

struct TrackerView: View {
    
    @State private var homeState: Bool = true
    
    var body: some View {
        
        NavigationStack {
            
            if homeState {
            
                ZStack {
                    
                    Color.flashLightGreen.ignoresSafeArea()
                    
                    VStack {
                        
                        Text("I own 0.0025 (BTC)")
                        
                    }
                    .background(.white)
                    .padding()
                    
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
