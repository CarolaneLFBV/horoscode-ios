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
        
        func fetch() async {
            horoscodes = await App.Repository.Horoscode().fetchData() ?? []
        }
    }
}
