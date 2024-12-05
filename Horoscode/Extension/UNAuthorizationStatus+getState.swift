//
//  UNAuthorizationStatus+getState.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 22/11/2024.
//

import Foundation
import UserNotifications

extension UNAuthorizationStatus {
    enum Constants {
        enum Authorization {
            static let notificationSuccess = String(localized: "NotificationAuthorizationSuccess")
            static let notificationDenied = String(localized: "NotificationAuthorizationDenied")
            static let notificationPending = String(localized: "NotificationAuthorizationPending")
            static let notificationDefault = String(localized: "NotificationAuthorizationDefault")
        }
    }
    
    func getState() -> String {
        switch self {
        case .authorized:
            return Constants.Authorization.notificationSuccess
        case .denied:
            return Constants.Authorization.notificationDenied
        case .notDetermined:
            return Constants.Authorization.notificationPending
        default:
            return Constants.Authorization.notificationDefault
        }
    }
}
