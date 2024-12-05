//
//  NotificationCenterView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 22/11/2024.
//

import SwiftUI

extension App.Views {
    struct NotificationCenter: View {
        @State private var notificationUseCase = App.UseCase.NotificationUseCase()
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("Notifications")
                    .boldTitle()
                Text("You can receive notifications about your horoscode by taping on Enable Notifiactions")
                
                RequestAuthorizationButton(notificationUseCase: notificationUseCase)
            }
            .frame(maxWidth: .infinity)
            .rectangleSection()
        }
    }
}

