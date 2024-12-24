//
//  DetailViewModel.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 24/11/2024.
//

import Foundation

extension App.Views.Detail {
    @Observable
    final class ViewModel {
        var signs: [App.Models.Sign] = []
        var errorMessage: String = ""
        var isAlertPresented: Bool = false
        
        private let repository = App.Repository.Horoscode()

        func fetch() async {
            switch await repository.fetchData() {
            case .success(let data):
                signs = data
            case .failure(let error):
                errorMessage = error.errorDescription
                isAlertPresented = true
            }
        }
    }
}
