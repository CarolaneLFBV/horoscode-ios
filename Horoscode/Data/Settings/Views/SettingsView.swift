//
//  SettingsView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 19/11/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color("PrimaryBackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                AboutAppView()
                SocialsView()
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
