//
//  HoroscodeRepository.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 23/11/2024.
//

import Foundation

extension App.Repository {
    struct Horoscode {
        func fetchData() async -> Result<[App.Models.Sign], Error> {
            switch await App.ClientAPI.HoroscodeAPI().downloadData() {
            case .success(let data):
                return .success(data.convert())
            case .failure(let error):
                return .failure(error)
            }
        }
    }
}
