import SwiftUI

extension App.Views.Settings {
    struct About: View {
        var body: some View {
            VStack(alignment: .leading) {
                VStack(alignment: .leading)  {
                    Text("About")
                        .boldTitle()
                    
                    Text("OriginalProject")
                        .padding(.bottom)
                    
                    HStack(alignment: .top) {
                        Image(systemName: "info.circle")
                        Text("HoroscodeGoal")
                    }
                    .italic()
                }

                HStack {
                    Link("HoroscodeWebsite", destination: URL(string: "https://horoscode.dev/")!)
                    Link("LinkedIn", destination: URL(string: "https://www.linkedin.com/in/cleprohon/")!)
                    Link("GitHub", destination: URL(string: "https://github.com/CedricLphn")!)
                }
                .foregroundStyle(Color("PinkHoroscode"))
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .rectangleSection()
        }
    }
}

#Preview {
    App.Views.Settings.About()
}
