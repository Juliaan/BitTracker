//
//  BTNavBarView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/05.
//

import SwiftUI

struct BTNavBarView: View {
    
    var body: some View {
    
        CustomNavView {
            
            ZStack {
                Color.orange.ignoresSafeArea()
                
                CustomNavLink(destination: Text("Destination")) {
                    Text("Navigate")
                }
                
            }
            .customNavigationTitle("Welcome")
            .customNavigationSubtitle(nil)
            .customNavigationBarBackButtonHidden(true)
            
        }
        
    }
    
}

#Preview {
    BTNavBarView()
}

extension BTNavBarView {
    
    private var defaultView: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color.green.ignoresSafeArea()
                
                NavigationLink (destination: Text("Destination")
                    .navigationTitle("Title 2")
                    .navigationBarBackButtonHidden(true)
                                , label: {
                    Text("Navigate")
                })
                
            }
            .navigationTitle("Nav Title here")
            
        }
        
    }
    
}
