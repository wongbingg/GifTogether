//
//  GifTogetherApp.swift
//  GifTogether
//
//  Created by 이원빈, 이은찬 on 2023/03/03.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}

@main
struct GifTogetherApp: App {
    @UIApplicationDelegateAdaptor (AppDelegate.self) var delegate
    @StateObject private var homeViewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homeViewModel)
        }
    }
}
