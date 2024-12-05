//
//  NotificationUseCase.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 21/11/2024.
//

import Foundation
import UserNotifications

extension App.UseCase {
    @Observable
    final class NotificationUseCase {
        
        enum Constants {
            enum Time: Int {
                case notificationHour = 6
                case notificationMinute = 0
            }
            enum NotificationContent {
                static let title = String(localized: "NotificationTitle")
                static let body = String(localized: "NotificationBody")
            }
        }
        
        private(set) var notifications: [UNNotificationRequest] = []
        
        func getAuthorizationStatus() async -> UNAuthorizationStatus {
            await withUnsafeContinuation { continuation in
                UNUserNotificationCenter.current().getNotificationSettings { settings in
                    continuation.resume(returning: settings.authorizationStatus)
                }
            }
        }
        
        func requestAuthorization() async {
            await withUnsafeContinuation { continuation in
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { isGranted, _ in
                    continuation.resume()
                }
            }
        }
        
        func createLocalNotification(completion: @escaping (Error?) -> Void) {
            var dateComponents = DateComponents()
            dateComponents.hour = Constants.Time.notificationHour.rawValue
            dateComponents.minute = Constants.Time.notificationMinute.rawValue
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
            let notificationContent = UNMutableNotificationContent()
            notificationContent.title = Constants.NotificationContent.title
            notificationContent.body = Constants.NotificationContent.body
            notificationContent.sound = .default
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: completion)
        }
    }
}
