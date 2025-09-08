//
//  CustomNavBarView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/05.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode

    let backButtonHidden: Bool
    let title: String
    let subTitle: String?
    
    var body: some View {
        
        HStack {
            
            if !backButtonHidden {
                backButton
            }
            
            Spacer()
            
            titleSection
            
            Spacer()
            
            if !backButtonHidden {
                backButton
                    .opacity(0)
            }
            
        }
        .padding()
        .font(.headline)
        .background(Color.flashGreen.ignoresSafeArea(edges: .top))
        .accentColor(.white)
        .foregroundColor(.white)
        
    }
    
}

#Preview {
    VStack {
    
        CustomNavBarView(backButtonHidden: false, title: "title", subTitle: "subtitle")
        Spacer()
        
    }
    
}

extension CustomNavBarView {
    
    private var backButton: some View {
        
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left.chevron.left.dotted")
                .font(.system(size: 30))
        })
        
    }
    
    private var titleSection: some View {
        
        VStack(spacing: 4) {
            
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            
            if let subtitle = subTitle {
                Text(subtitle)
            }
            
        }
        
    }
    
}
