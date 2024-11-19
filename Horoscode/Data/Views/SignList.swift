//
//  SignList.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 19/11/2024.
//

import SwiftUI

struct SignList: View {
    @State var vm = ContentViewModel()
    
    var body: some View {
        Group {
            List {
                ForEach(vm.searchResults) { response in
                    Text(response.sign)
                }
            }
            .onAppear {
                if vm.signData.isEmpty {
                    Task {
                        await vm.fetchData()
                        print(vm.signData)
                    }
                }
            }
        }
        .searchable(text: $vm.searchText)
    }
}


#Preview {
    SignList()
}
