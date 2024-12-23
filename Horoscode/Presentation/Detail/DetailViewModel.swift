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
        var horoscodes: [App.Models.Sign] = []
        var errorMessage: String? = nil

        func fetch() async {
            let result = await App.Repository.Horoscode().fetchData()
            
            switch result {
            case .success(let signs):
                horoscodes = signs
                errorMessage = nil
            case .failure(let error):
                horoscodes = []
                errorMessage = error.localizedDescription
            }
        }
    }
}
