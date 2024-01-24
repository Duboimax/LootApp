//
//  LootAppApp.swift
//  LootApp
//
//  Created by Maxence DUBOIS on 1/19/24.
//

import SwiftUI

@main
struct LootAppApp: App {
    
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isOnboardingDone{
                ContentView()
            } else {
                OnBoarding()
            }
        }
    }
}
