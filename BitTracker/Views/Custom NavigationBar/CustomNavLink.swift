//
//  CustomNavLink.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/05.
//

import SwiftUI

struct CustomNavLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
    
        self.destination = destination
        self.label = label()
        
    }
    var body: some View {
        NavigationLink(
            destination: NavBarContainerView(content: {
                destination
            })
            .navigationBarHidden(true)
            ,
            label: {
                label
            }
        )
    }
}

#Preview {
    
    CustomNavView {
     
        CustomNavLink(destination: Text("destination")) {
            Text("click me")
        }
        
    }
    
}
