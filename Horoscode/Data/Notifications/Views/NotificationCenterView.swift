//
//  NotificationCenterView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 22/11/2024.
//

import SwiftUI

extension AstroSign.Views {
    struct NotificationCenterView: View {
        @State private var repository = AstroSign.Repositories.NotificationRepository()
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("Notifications")
                    .boldTitle()
                Text("You can receive notifications about your horoscode by cling on Enable Notifiactions")
                
                AstroSign.Views.RequestAuthorizationButton(repository: repository)
            }
            .frame(maxWidth: .infinity)
            .rectangleSection()
        }
    }
}

