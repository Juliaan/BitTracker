//
//  BitTrackerApp.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/03.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    private var apiKey: String?
    private let firebaseStoreReader = FirebaseStoreReader()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        firebaseStoreReader.fetchAPIKey { key in
            self.apiKey = key
            
            //JE: Save the API key to keychain for later when the API requests need it
            let success = KeychainHelper.shared.saveAPIKey(self.apiKey!)
            print("keychain Save : \(success)")
            
        }
        
        return true
        
    }
    
}

@main
struct BitTrackerApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    let didCompleteSetup = UserDefaults.standard.bool(forKey: "DidCompleteSetup")
    
    init() {
        // Set your desired color
        setNavigationBarColor(backgroundColor: UIColor(Color.flashDarkGreen))
        
        UITableView.appearance().separatorStyle = .none
        
    }
    
    var body: some Scene {
        WindowGroup {
            if didCompleteSetup {
                //TrackerView()
            } else {
                LandingView()
            }
            
        }
    }
}

//JE: Custom styling via UIKit to style navbar background color
func setNavigationBarColor(backgroundColor: UIColor, titleColor: UIColor = .white) {
    
    let appearance = UINavigationBarAppearance()
    
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = backgroundColor
    appearance.titleTextAttributes = [.foregroundColor: titleColor]
    appearance.largeTitleTextAttributes = [.foregroundColor: titleColor]

    UINavigationBar.appearance().standardAppearance = appearance
    
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
    
    UINavigationBar.appearance().tintColor = UIColor.white
    UINavigationBar.appearance().barTintColor = UIColor.white
    
}
