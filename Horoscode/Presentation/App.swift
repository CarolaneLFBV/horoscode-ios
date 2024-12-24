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
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                App.Views.ContentView()

            }
        }
        
    }
}
