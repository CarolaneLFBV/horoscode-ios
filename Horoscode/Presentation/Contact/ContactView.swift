//
//  ContactView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 05/01/2025.
//

import SwiftUI

extension App.Views.Settings {
    struct ContactView: View {
        @Environment(\.openURL) private var openUrl
        @State private var isPresented: Bool = false
        
        private enum Constants {
            static let contactEmail = String(localized: "app.support.email")
            static let errorUrl = String(localized: "error.api.email")
        }
        
        var body: some View {
            VStack(alignment: .leading)  {
                Text("contact.title")
                    .boldTitle()
                
                Text("contact.description")
                    .padding(.bottom)
                
                Button {
                    sendEmail(openUrl: openUrl)
                } label: {
                    Text("contact.button")
                }
                .foregroundStyle(Color("PinkHoroscode"))

            }
            .padding(.horizontal)
            .rectangleSection()
            .alert(isPresented: $isPresented) {
                Alert(
                    title: Text("error.title"),
                    message: Text(Constants.errorUrl),
                    dismissButton: .default(Text("OK"), action: { isPresented = false })
                )
            }
        }
        
        private func sendEmail(openUrl: OpenURLAction) {
            let urlString = "mailto:\(Constants.contactEmail)"
            guard let url = URL(string: urlString) else { return }
            openUrl(url) { accepted in
                if !accepted {
                    isPresented = true
                }
            }
        }
    }
}


#Preview {
    App.Views.Settings.ContactView()
}
