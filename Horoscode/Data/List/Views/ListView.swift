import SwiftUI

extension AstroSign.Views {
    struct SignList: View {
        @State var vm = AstroSign.ViewModels.ListViewModel()
        var body: some View {
            NavigationStack {
                ZStack {
                    Color("PrimaryBackgroundColor")
                        .ignoresSafeArea()
                    
                    content
                        .onAppear {
                            if vm.signData.isEmpty {
                                Task {
                                    await vm.fetchData()
                                }
                            }
                        }
                }
            }
            
        }
    }
}

extension AstroSign.Views.SignList {
    private var content: some View {
        AstroSign.Views.SignList.ContentList(vm: vm)
    }
}

#Preview {
    AstroSign.Views.SignList()
}
