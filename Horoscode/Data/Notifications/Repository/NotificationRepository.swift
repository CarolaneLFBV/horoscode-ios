//
//  NotificationRepository.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 21/11/2024.
//

import Foundation
import UserNotifications

extension AstroSign.Repositories {
    @Observable
    final class NotificationRepository {
        private(set) var notifications: [UNNotificationRequest] = []
        private(set) var authorizationStatus: UNAuthorizationStatus?
        
        func reloadAuthorizationStatus() {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                DispatchQueue.main.async {
                    self.authorizationStatus = settings.authorizationStatus
                }
            }
        }
        
        func requestAuthorization() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { isGranted, _ in
                DispatchQueue.main.async {
                    self.authorizationStatus = isGranted ? .authorized : .denied
                }
            }
        }

        func createLocalNotification(completion: @escaping (Error?) -> Void) {
            var dateComponents = DateComponents()
            dateComponents.hour = 6
            dateComponents.minute = 0
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
            let notificationContent = UNMutableNotificationContent()
            notificationContent.title = "Horoscode"
            notificationContent.body = "Come and check out your horoscode of the day!"
            notificationContent.sound = .default
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: completion)
        }
    }

}
