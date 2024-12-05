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
        private enum Constants {
            enum Time: Int {
                case notificationHour = 7
            }
            
            enum NotificationContent {
                static let title = String(localized: "NotificationTitle")
                static let body = String(localized: "NotificationBody")
            }
            
            enum Error: Swift.Error {
                case notificationNotAvailable
            }
        }
        
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
                    
                    if isGranted {
                        Task {
                            do {
                                try await self.createLocalNotification { error in
                                    if let error = error {
                                        print("Failed to schedule notification: \(error)")
                                    }
                                }
                            } catch {
                                print("Error scheduling notification: \(error)")
                            }
                        }
                    }
                }
            }
        }
        
        func createLocalNotification(completion: @escaping (Error?) -> Void) async throws {
            let notificationContent = UNMutableNotificationContent()
            notificationContent.title = Constants.NotificationContent.title
            notificationContent.body = Constants.NotificationContent.body
            notificationContent.sound = .default
            
            var dateComponents = DateComponents()
            dateComponents.hour = Constants.Time.notificationHour.rawValue
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents,
                                                        repeats: true)
            let request = UNNotificationRequest(identifier: UUID().uuidString,
                                                content: notificationContent,
                                                trigger: trigger)
            
            let notificationCenter = UNUserNotificationCenter.current()
            do {
                try await notificationCenter.add(request)
            } catch {
                throw Constants.Error.notificationNotAvailable
            }
        }
    }
}
