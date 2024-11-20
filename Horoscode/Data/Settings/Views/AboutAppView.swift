import SwiftUI

struct AboutAppView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("About Horoscode")
                .boldTitle()
            Text("Original Idea Made By Cedric Leprohon")
                .padding(.bottom)
            Link("Visit The Website Here", destination: URL(string: "https://horoscode.dev/")!)
                .foregroundStyle(Color("PinkHoroscode"))
        }
        .frame(maxWidth: .infinity)
        .rectangleSection()
    }
}

#Preview {
    AboutAppView()
}
