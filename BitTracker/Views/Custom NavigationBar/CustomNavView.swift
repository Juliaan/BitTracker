//
//  CustomNavView.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/05.
//

import SwiftUI

struct CustomNavView<Content: View>: View {

    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        NavigationStack {
            
            NavBarContainerView {
                content
            }
            .navigationBarHidden(true)
        
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
}

#Preview {
    CustomNavView {
        Color.red.ignoresSafeArea()
    }
}

//JE: Make sure after all the customisations that we can still swipe back
extension UINavigationController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
