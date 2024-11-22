//
//  SettingsView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 19/11/2024.
//

import SwiftUI

extension AstroSign.Settings.Views {
    struct SettingsView: View {
        var body: some View {
            ZStack {
                Color("PrimaryBackgroundColor")
                    .ignoresSafeArea()
                
                ScrollView {
                    AstroSign.Notification.Views.NotificationCenterView()
                    AstroSign.Settings.Views.AboutView()
                    AstroSign.Settings.Views.SocialsView()
                }
                .padding()
            }
        }
    }
}

#Preview {
    AstroSign.Settings.Views.SettingsView()
}
