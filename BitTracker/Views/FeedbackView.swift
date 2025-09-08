//
//  FeedbackView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/05.
//

import SwiftUI

struct FeedbackView: View {
    
    var imageName: String = "info.bubble"
    var title: String = "Title Text"
    var infoText: String = ""
    
    var body: some View {
        
        ZStack {
            
            VStack {
                //JE: Image
                Image(systemName: imageName)
                    .font(.system(size: 24))
                    .padding(5)
                
                //JE: title
                Text(title)
                    .font(.system(size: 22))
                    .padding(5)
                    .fontWeight(.semibold)
                
                //JE: info
                Text(infoText)
                    .padding(5)
                
            }
            .padding()
            .symbolEffect(.breathe.pulse.wholeSymbol, options: .nonRepeating)
            .foregroundColor(Color.flashDarkGreen)
            
        }
        
    }
    
}

#Preview {
    FeedbackView()
}
