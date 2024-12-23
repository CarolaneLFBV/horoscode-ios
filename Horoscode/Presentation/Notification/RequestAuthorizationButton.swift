import SwiftUI
import UserNotifications

extension App.Views.NotificationCenter {
    struct RequestAuthorizationButton: View {
        @State var notificationUseCase: App.UseCase.NotificationUseCase
        @State private var notificationStatus: UNAuthorizationStatus?
        @State private var showAlert: Bool = false
        @State private var alertMessage: String? = nil

        var body: some View {
            VStack {
                Button(action: {
                    Task { await requestNotificationAuthorization() }
                }) {
                    Text("EnableNotifications")
                }
                .buttonModifier()
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("NotificationStatus"),
                    message: Text(alertMessage ?? ""),
                    dismissButton: .default(Text("OK"))
                )
            }
        }

        private func requestNotificationAuthorization() async {
            await notificationUseCase.requestAuthorization { result in
                switch result {
                case .success:
                    alertMessage = "Notifications successfully enabled!"
                case .failure(let error):
                    alertMessage = "Error: \(error.localizedDescription)"
                }
                showAlert = true
            }
            notificationStatus = await notificationUseCase.getAuthorizationStatus()
        }
    }
}
