import SwiftUI

extension AstroSign.Views {
    struct ContentView: View {
        var body: some View {
            NavigationStack {
                AstroSign.Views.SignList()
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            AstroSign.Components.NavigationTitle(text: "Horoscode")
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink(destination: SettingsView()) {
                                Label("Settings", systemImage: "gearshape")
                            }
                            .tint(.white)
                        }
                    }
            }
        }
    }
}

#Preview {
    AstroSign.Views.ContentView()
}
