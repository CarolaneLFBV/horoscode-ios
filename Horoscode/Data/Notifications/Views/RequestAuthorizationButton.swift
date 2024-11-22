import SwiftUI
import UserNotifications

extension AstroSign.Notification.Views {
    struct RequestAuthorizationButton: View {
        @State var repository: AstroSign.Notification.Repositories.NotificationRepository
        @State private var notificationStatus: UNAuthorizationStatus?

        var body: some View {
            VStack {
                Button(action: {
                    Task {
                        await getNotificationStatus()
                    }
                }) {
                    Text("Enable Notifications")
                }
                .buttonModifier() 

                if let status = notificationStatus {
                    Text(status.getState())
                          .font(.caption)
                          .foregroundColor(status == .authorized ? .green : .red)
                  }
            }
        }

        private func getNotificationStatus() async {
            await repository.requestAuthorization()
            notificationStatus = await repository.getAuthorizationStatus()
        }
    }

}
