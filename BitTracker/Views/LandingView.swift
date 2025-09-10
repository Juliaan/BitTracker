//
//  ContentView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/03.
//

import SwiftUI

struct LandingView: View {
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color.flashGreen.ignoresSafeArea() // Extending the background past the safe area edges
                
                VStack {
                
                    Spacer()
                    
                    Welcome()
                    
                    NavigationLink(destination: BitcoinSetupView(editing: false, showBackButton: false)) {
                        HStack {
                            Text("Let's get started")
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
                    }
                    .padding()
                    
                    Spacer()
                    
                }
                .onAppear {
 
                }
                
            }
            
        }
        
    }
    
}

#Preview {
    LandingView()
}
