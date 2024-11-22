//
//  SettingsView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 19/11/2024.
//

import SwiftUI

extension AstroSign.Views {
    struct SettingsView: View {
        var body: some View {
            ZStack {
                Color("PrimaryBackgroundColor")
                    .ignoresSafeArea()
                
                ScrollView {
                    AstroSign.Views.NotificationCenterView()
                    AstroSign.Views.AboutAppView()
                    AstroSign.Views.SocialsView()
                }
                .padding()
            }
        }
    }
}

#Preview {
    AstroSign.Views.SettingsView()
}
