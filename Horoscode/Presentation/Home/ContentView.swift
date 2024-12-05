import SwiftUI

extension App.Views {
    struct ContentView: View {
        var body: some View {
            NavigationStack {
                App.Views.List()
                    .navigationTitle("Horoscode")
                    .toolbar {
                        ToolbarItem {
                            NavigationLink(destination: App.Views.Settings()) {
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
    App.Views.ContentView()
}
