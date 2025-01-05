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
            ScrollView {
                App.Views.NotificationCenter()
                App.Views.Settings.About()
                App.Views.Settings.ContactView()
            }
            .padding()
            .background{
                Color("PrimaryBackgroundColor")
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    App.Views.Settings()
}
