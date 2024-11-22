//
//  NotificationRepository.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 21/11/2024.
//

import Foundation
import UserNotifications

extension AstroSign.Notification.Repositories {
    @Observable
    final class NotificationRepository {
        enum Time: Int {
            case notificationHour = 6
            case notificationMinute = 0
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
            dateComponents.hour = Time.notificationHour.rawValue
            dateComponents.minute = Time.notificationMinute.rawValue
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
            let notificationContent = UNMutableNotificationContent()
            notificationContent.title = AstroSign.Notification.Constants.NotificationContent.title
            notificationContent.body = AstroSign.Notification.Constants.NotificationContent.body
            notificationContent.sound = .default
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: completion)
        }
    }
    
}
