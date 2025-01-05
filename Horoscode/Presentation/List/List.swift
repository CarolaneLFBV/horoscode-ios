import SwiftUI

extension App.Views {
    struct List: View {
        @State var viewModel = App.Views.List.ViewModel()
        
        var body: some View {
            content
                .task {
                    if viewModel.signs.isEmpty {
                        await viewModel.fetch()
                    }
                }
                .background{
                    Color("PrimaryBackgroundColor")
                        .ignoresSafeArea()
                }
                .alert(isPresented: $viewModel.isAlertPresented) {
                    Alert(
                        title: Text("error.title"),
                        message: Text(viewModel.errorMessage),
                        dismissButton: .default(Text("OK"), action: { viewModel.isAlertPresented = false })
                    )
                }
        }
    }
}

extension App.Views.List {
    private var content: some View {
        App.Views.List.Content(viewModel: viewModel)
    }
}

#Preview {
    App.Views.List()
}
