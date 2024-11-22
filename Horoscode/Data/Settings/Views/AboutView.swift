import SwiftUI

extension AstroSign.Settings.Views {
    struct AboutView: View {
        var body: some View {
            VStack(alignment: .leading) {
                VStack(alignment: .leading)  {
                    Text("About")
                        .boldTitle()
                    HStack(alignment: .top) {
                        Image(systemName: "info.circle")
                        Text("Horoscode is here to provide a simple way for people to learn about astrology in a fun way.")
                    }
                    .italic()
                    .padding(.bottom, 4)
                    
                    Text("Original Idea Made by Cedric Leprohon.")
                }
                .padding(.bottom)

                Link("Visit The Website Here", destination: URL(string: "https://horoscode.dev/")!)
                    .foregroundStyle(Color("PinkHoroscode"))
            }
            .frame(maxWidth: .infinity)
            .rectangleSection()
        }
    }
}

#Preview {
    AstroSign.Settings.Views.AboutView()
}
