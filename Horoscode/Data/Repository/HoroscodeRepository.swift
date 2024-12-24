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
                return .failure(.init(error))
            }
        }
    }
}

extension App.Repository.Horoscode {
    enum Error: LocalizedError {
        case noNetwork, serverError, invalidData
        
        var errorDescription: String {
            switch self {
            case .noNetwork: return String(localized: "error.api.noNetwork")
            case .serverError: return String(localized: "error.api.serverError")
            case .invalidData: return String(localized: "error.api.invalidData")
            }
        }
        
        init(_ error: App.ClientAPI.HoroscodeAPI.Error) {
            self = switch error {
            case .noNetwork:
                    .noNetwork
            case .badStatus, .badUrl, .badResponse, .badRequest:
                    .serverError
            case .failedToDecodeResponse:
                    .invalidData
            }
        }
    }
}
