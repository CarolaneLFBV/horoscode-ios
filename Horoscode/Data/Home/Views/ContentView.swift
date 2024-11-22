import SwiftUI

extension AstroSign.Home.Views {
    struct ContentView: View {
        var body: some View {
            NavigationStack {
                AstroSign.List.Views.SignList()
                    .navigationTitle("Horoscode")
                    .toolbar {
                        ToolbarItem {
                            NavigationLink(destination: AstroSign.Settings.Views.SettingsView()) {
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
    AstroSign.Home.Views.ContentView()
}
