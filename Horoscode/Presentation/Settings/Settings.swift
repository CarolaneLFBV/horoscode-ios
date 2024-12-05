//
//  SettingsView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 19/11/2024.
//

import SwiftUI

extension App.Views {
    struct Settings: View {
        var body: some View {
            ZStack {
                Color("PrimaryBackgroundColor")
                    .ignoresSafeArea()
                
                ScrollView {
                    App.Views.NotificationCenter()
                    App.Views.Settings.About()
                }
                .padding()
            }
        }
    }
}

#Preview {
    App.Views.Settings()
}
