//
//  NotificationCenterView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 22/11/2024.
//

import SwiftUI

extension AstroSign.Notification.Views {
    struct NotificationCenterView: View {
        @State private var repository = AstroSign.Notification.Repositories.NotificationRepository()
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("Notifications")
                    .boldTitle()
                Text("You can receive notifications about your horoscode by taping on Enable Notifiactions")
                
                AstroSign.Notification.Views.RequestAuthorizationButton(repository: repository)
            }
            .frame(maxWidth: .infinity)
            .rectangleSection()
        }
    }
}

