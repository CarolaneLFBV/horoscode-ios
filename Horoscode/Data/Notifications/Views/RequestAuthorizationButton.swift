import SwiftUI
import UserNotifications

extension AstroSign.Views {
    struct RequestAuthorizationButton: View {
        @State var repository: AstroSign.Repositories.NotificationRepository
        @State private var statusMessage: String = ""

        var body: some View {
            VStack {
                Button(action: requestAuthorization) {
                    Text("Enable Notifications")
                        .buttonModifier()
                }

                if !statusMessage.isEmpty {
                    Text(statusMessage)
                        .font(.caption)
                        .foregroundColor(repository.authorizationStatus == .authorized ? .green : .red)
                        .padding(.top, 10)
                }
            }
            .onAppear {
                repository.reloadAuthorizationStatus()
            }
        }

        private func requestAuthorization() {
            repository.requestAuthorization()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // Allow time for async update
                if let status = repository.authorizationStatus {
                    switch status {
                    case .authorized:
                        statusMessage = "Notifications enabled successfully!"
                    case .denied:
                        statusMessage = "Notifications denied. Please enable them in settings."
                    case .notDetermined:
                        statusMessage = "Notification status is pending."
                    default:
                        statusMessage = "Unknown notification status."
                    }
                } else {
                    statusMessage = "Failed to retrieve authorization status."
                }
            }
        }
    }

}
