import Foundation

extension App.ClientAPI {
    struct HoroscodeAPI {
        enum Constants {
            enum NetworkError: Error {
                case badUrl(reason: String), badStatus(reason: String), badResponse(reason: String), failedToDecodeResponse(reason: String)
            }
            
            enum NetworkErrorNotification {
                static let badResponseReason = String(localized: "badResponseReason")
                static let badUrlReason = String(localized: "badUrlReason")
                static let badStatusReason = String(localized: "badStatusReason")
                static let failedToDecodeResponseReason = String(localized: "failedToDecodeResponseReason")
            }
            
            enum Endpoint {
                static let url = URL(string: "https://horoscode.dev/api/v1/horoscopes")!
            }
        }
        
        func downloadData() async -> Result<[Response], Constants.NetworkError> {
            do {
                let (data, response) = try await URLSession.shared.data(from: Constants.Endpoint.url)
                guard let response = response as? HTTPURLResponse else {
                    return .failure(.badResponse(reason: Constants.NetworkErrorNotification.badResponseReason))
                }
                guard response.statusCode >= 200 && response.statusCode < 300 else {
                    return .failure(.badStatus(reason: Constants.NetworkErrorNotification.badStatusReason))
                }
                guard let decodedResponse = try? JSONDecoder().decode([Response].self, from: data) else {
                    return .failure(.failedToDecodeResponse(reason: Constants.NetworkErrorNotification.failedToDecodeResponseReason))
                }
                return .success(decodedResponse)
            } catch {
                return .failure(.badUrl(reason: Constants.NetworkErrorNotification.badUrlReason))
            }
        }
    }
}
