import SwiftUI
import UserNotifications

extension App.Views.NotificationCenter {
    struct RequestAuthorizationButton: View {
        @State var notificationUseCase: App.UseCase.NotificationUseCase
        @State private var notificationStatus: UNAuthorizationStatus?
        @State private var showAlert: Bool = false
        @State private var alertMessage: String? = nil
        
        private enum Constants {
            static let alertSuccess = String(localized: "notifications.success")
            static let alertError = String(localized: "error.notifications")
        }

        var body: some View {
            VStack {
                Button(action: {
                    Task { await requestNotificationAuthorization() }
                }) {
                    Text("notifications.enable")
                }
                .buttonModifier()
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("notifications.status"),
                    message: Text(alertMessage ?? ""),
                    dismissButton: .default(Text("OK"))
                )
            }
        }

        private func requestNotificationAuthorization() async {
            await notificationUseCase.requestAuthorization { result in
                switch result {
                case .success:
                    alertMessage = Constants.alertSuccess
                case .failure:
                    alertMessage = Constants.alertError
                }
                showAlert = true
            }
            notificationStatus = await notificationUseCase.getAuthorizationStatus()
        }
    }
}
