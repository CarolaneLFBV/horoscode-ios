//
//  NotificationConstant.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 22/11/2024.
//


extension AstroSign.Notification.Constants {
    enum NotificationContent {
        static let title = String(localized: "NotificationTitle")
        static let body = String(localized: "NotificationBody")
    }
    enum Authorization {
        static let notificationSuccess = String(localized: "NotificationAuthorizationSuccess")
        static let notificationDenied = String(localized: "NotificationAuthorizationDenied")
        static let notificationPending = String(localized: "NotificationAuthorizationPending")
        static let notificationDefault = String(localized: "NotificationAuthorizationDefault")
    }
}
