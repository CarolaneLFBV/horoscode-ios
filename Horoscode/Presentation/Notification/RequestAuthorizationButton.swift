import SwiftUI
import UserNotifications

extension App.Views.NotificationCenter {
    struct RequestAuthorizationButton: View {
        @State var notificationUseCase: App.UseCase.NotificationUseCase
        @State private var notificationStatus: UNAuthorizationStatus?

        var body: some View {
            VStack {
                Button(action: {
                    Task { await getNotificationStatus() }
                }) {
                    Text("EnableNotifications")
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
            await notificationUseCase.requestAuthorization()
            notificationStatus = await notificationUseCase.getAuthorizationStatus()
        }
    }
}
