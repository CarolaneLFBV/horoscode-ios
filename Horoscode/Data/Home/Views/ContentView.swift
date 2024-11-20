import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            AstroSign.Views.SignList()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationTitle()
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

#Preview {
    ContentView()
}
