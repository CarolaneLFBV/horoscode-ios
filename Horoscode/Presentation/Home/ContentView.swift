import SwiftUI

extension App.Views {
    struct ContentView: View {
        @AppStorage("isOnboardingShowing") var isOnboardingShowing: Bool = true
        
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
                    .sheet(isPresented: $isOnboardingShowing) {
                        OnBoardingView(isOnboardingComplete: $isOnboardingShowing)
                    }
            }
        }
    }
}

#Preview {
    App.Views.ContentView()
}
