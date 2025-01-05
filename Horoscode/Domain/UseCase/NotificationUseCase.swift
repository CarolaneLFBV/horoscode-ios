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
                static let title = String(localized: "app.title")
                static let body = String(localized: "horoscode.notification.body")
            }
            
            enum Error: Swift.Error {
                case notificationNotAvailable
                case notificationCreationFailed
            }
        }
        
        func getAuthorizationStatus() async -> UNAuthorizationStatus {
            await withUnsafeContinuation { continuation in
                UNUserNotificationCenter.current().getNotificationSettings { settings in
                    continuation.resume(returning: settings.authorizationStatus)
                }
            }
        }
        
        func requestAuthorization(completion: @escaping (Result<Void, Error>) -> Void) async {
            let isGranted = await withUnsafeContinuation { continuation in
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, _ in
                    continuation.resume(returning: granted)
                }
            }

            if isGranted {
                do {
                    try await createLocalNotification()
                    completion(.success(()))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(Constants.Error.notificationNotAvailable))
            }
        }

        
        func createLocalNotification() async throws {
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
