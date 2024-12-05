//
//  HoroscodeRepository.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 23/11/2024.
//

import Foundation

extension App.Repository {
    struct Horoscode {
        func fetchData() async -> [App.Models.Sign]? {
            guard let data = await App.ClientAPI.HoroscodeAPI().downloadData() else {
                return nil
            }
            return data.convert()
        }
    }
}
