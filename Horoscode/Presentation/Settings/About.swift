import SwiftUI

extension App.Views.Settings {
    struct About: View {
        
        private enum Constants {
            static let websiteUrl = String(localized: "about.website.url")
            static let linkedinUrl = String(localized: "about.linkedin.url")
            static let githubUrl = String(localized: "about.github.url")
        }
        
        var body: some View {
            VStack(alignment: .leading) {
                VStack(alignment: .leading)  {
                    Text("about.title")
                        .boldTitle()
                    
                    Text("about.description")
                        .padding(.bottom)
                    
                    HStack(alignment: .top) {
                        Image(systemName: "info.circle")
                        Text("about.horoscode.goal")
                    }
                    .italic()
                }

                HStack {
                    Link("about.website", destination: URL(string: Constants.websiteUrl)!)
                    Link("about.linkedin", destination: URL(string: Constants.linkedinUrl)!)
                    Link("about.github", destination: URL(string: Constants.githubUrl)!)
                }
                .foregroundStyle(Color("PinkHoroscode"))
            }
            .padding(.horizontal)
            .rectangleSection()
        }
    }
}

#Preview {
    App.Views.Settings.About()
}
