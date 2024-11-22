import Foundation

extension AstroSign {
    struct Entity: Identifiable, Codable {
        let id = UUID()
        let sign: String
        let date: String
        private let contentFr: String
        private let contentEn: String
        let rate: Int
        
        enum CodingKeys: String, CodingKey {
            case id
            case sign
            case date
            case contentFr = "content_fr"
            case contentEn = "content_en"
            case rate
        }
        
        func getContent() -> String {
            if let languageCode = Locale.current.language.languageCode?.identifier.lowercased() {
                if languageCode.contains("fr") {
                    return contentFr
                }
            }
            return contentEn
        }
    }
}

