import SwiftUI

enum SignType: String, CaseIterable {
    case virgo, capricorn, aquarius, sagittarius, pisces, aries, taurus, gemini, leo, scorpio, cancer, libra
    
    static let signMapping: [String: SignType] = {
        var mapping: [String: SignType] = [:]
        for sign in SignType.allCases {
            mapping[sign.rawValue] = sign
        }
        return mapping
    }()
    
    static func fromString(_ sign: String) -> SignType? {
        return signMapping[sign.lowercased()]
    }
    
    // Image for the sign
    var imageName: String {
        switch self {
        case .virgo:
            return "♍️"
        case .capricorn:
            return "♑️"
        case .aquarius:
            return "♒️"
        case .sagittarius:
            return "♐️"
        case .pisces:
            return "♓️"
        case .aries:
            return "♈️"
        case .taurus:
            return "♉️"
        case .gemini:
            return "♊️"
        case .leo:
            return "♌️"
        case .scorpio:
            return "♏️"
        case .cancer:
            return "♋️"
        case .libra:
            return "♎️"
        }
    }
}
