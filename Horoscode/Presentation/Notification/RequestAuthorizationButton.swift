import SwiftUI
import UserNotifications

extension App.Views.NotificationCenter {
    struct RequestAuthorizationButton: View {
        @State var notificationUseCase: App.UseCase.NotificationUseCase
        @State private var notificationStatus: UNAuthorizationStatus?
        @State private var showAlert: Bool = false

        var body: some View {
            VStack {
                Button(action: {
                    Task { await getNotificationStatus() }
                }) {
                    Text("EnableNotifications")
                }
                .buttonModifier()
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("NotificationStatus"),
                    message: Text(notificationStatus?.getState() ?? ""),
                    dismissButton: .default(Text("OK"))
                )
            }
        }

        private func getNotificationStatus() async {
            await notificationUseCase.requestAuthorization()
            notificationStatus = await notificationUseCase.getAuthorizationStatus()
            showAlert = true
        }
    }
}
