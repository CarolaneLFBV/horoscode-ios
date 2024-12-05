//
//  Response.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 23/11/2024.
//

import Foundation

extension App.ClientAPI.HoroscodeAPI {
    struct Response: Codable {
        let astroSign: String
        let date: String
        let contentFr: String
        let contentEn: String
        let rate: Int
        
        enum CodingKeys: String, CodingKey {
            case astroSign = "sign"
            case date
            case contentFr = "content_fr"
            case contentEn = "content_en"
            case rate
        }
    }
}
