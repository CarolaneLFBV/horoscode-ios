//
//  HoroscodeApp.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 19/11/2024.
//

import SwiftUI
import StoreKit

@main
struct App: SwiftUI.App {
    @Environment(\.requestReview) private var requestReview
    @AppStorage("launchNumber") var launchNumber: Int = 0
    @AppStorage("lastVersionPromptedForReview") var lastVersionPromptedForReview = ""
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                App.Views.ContentView()
            }
            .onChange(of: launchNumber) {
                guard let currentAppVersion = Bundle.currentAppVersion else { return }
                print(launchNumber)
                if launchNumber >= 4, currentAppVersion != lastVersionPromptedForReview {
                    presentReview()
                    lastVersionPromptedForReview = currentAppVersion
                }
            }
        }
    }
    private func presentReview() {
        Task {
            try await Task.sleep(for: .seconds(2))
            await requestReview()
        }
    }
}
