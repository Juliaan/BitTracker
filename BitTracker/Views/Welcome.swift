//
//  Welcome.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/03.
//

import SwiftUI

struct Welcome: View {

    var body: some View {
        
            VStack {
                
                HStack {
                    
                    Image("Logo")
                    
                    Text("BitTracker_")
                        .font(.system(size: 36))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading) // Example content
                    
                }
                .padding(0)
                
                // styled tagline
                VStack(alignment: .leading) {
                    Text("Monitor")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                        .italic()
                    +
                    Text(" your Bitcoin Wealth in")
                        .font(.system(size: 24, weight: .regular, design: .default))
                    
                    Text("Real Time!")
                        .font(.system(size: 32, weight: .bold, design: .default))
                }
                .padding(0)
                
            }
            .onAppear {
                
            }
            
    
    }
    
}

#Preview {
    Welcome()
}
