//
//  NavBarContainerView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/05.
//

import SwiftUI

struct NavBarContainerView<Content: View>: View {
    
    let content: Content
    
    @State private var backButtonHidden: Bool = false
    @State private var title: String = ""
    @State private var subTitle: String? = nil
    
    //JE: initialiser to init content
    init(@ViewBuilder content: () -> Content) {
        
        self.content = content()
        
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            CustomNavBarView(backButtonHidden: backButtonHidden, title: title, subTitle: subTitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self, perform: { value in
            self.subTitle = value
        })
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self, perform: { value in
            self.backButtonHidden = value
        })
    }
    
}

#Preview {
    NavBarContainerView {
        
        ZStack {
            Color.flashLightGreen.ignoresSafeArea()
            
            Text("Hello flash team!")
                .foregroundColor(.white)
                .font(.system(size: 30))
                .customNavigationTitle("new title")
        }
        
    }
    
}
