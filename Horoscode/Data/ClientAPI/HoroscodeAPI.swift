import Foundation

extension App.ClientAPI {
    struct HoroscodeAPI {
        enum Constants {
            enum Endpoint {
                static let url = URL(string: "https://horoscode.dev/api/v1/horoscopes")!
            }
        }
        
        func downloadData() async -> Result<[Response], Error> {
            do {
                let (data, response) = try await URLSession.shared.data(from: Constants.Endpoint.url)
                guard let response = response as? HTTPURLResponse else {
                    return .failure(.badResponse)
                }
                guard response.statusCode >= 200 && response.statusCode < 300 else {
                    return .failure(.badStatus)
                }
                guard let decodedResponse = try? JSONDecoder().decode([Response].self, from: data) else {
                    return .failure(.failedToDecodeResponse)
                }
                return .success(decodedResponse)
            } catch URLError.notConnectedToInternet {
                return .failure(.noNetwork)
            } catch {
                return .failure(.badRequest)
            }
        }
    }
}

extension App.ClientAPI.HoroscodeAPI {
    enum Error: Swift.Error {
        case badResponse, badStatus, badUrl, failedToDecodeResponse, noNetwork, badRequest
    }
}
