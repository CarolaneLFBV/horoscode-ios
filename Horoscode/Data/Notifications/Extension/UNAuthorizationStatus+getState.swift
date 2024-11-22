//
//  UNAuthorizationStatus+getState.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 22/11/2024.
//

import Foundation
import UserNotifications

extension UNAuthorizationStatus {
    func getState() -> String {
        switch self {
        case .authorized:
            return AstroSign.Notification.Constants.Authorization.notificationSuccess
        case .denied:
            return AstroSign.Notification.Constants.Authorization.notificationDenied
        case .notDetermined:
            return AstroSign.Notification.Constants.Authorization.notificationPending
        default:
            return AstroSign.Notification.Constants.Authorization.notificationDefault
        }
    }
}
