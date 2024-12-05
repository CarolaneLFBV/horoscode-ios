import Foundation

extension App.ClientAPI {
    struct HoroscodeAPI {
        private enum Constants {
            enum NetworkError: Error {
                case badUrl, badStatus, badResponse, failedToDecodeResponse
            }
            
            enum Endpoint {
                static let url = URL(string: "https://horoscode.dev/api/v1/horoscopes")!
            }
        }
        
        func downloadData() async -> [Response]? {
            do {
                let (data, response) = try await URLSession.shared.data(from: Constants.Endpoint.url)
                guard let response = response as? HTTPURLResponse else { throw Constants.NetworkError.badResponse }
                guard response.statusCode >= 200 && response.statusCode < 300 else { throw Constants.NetworkError.badStatus }
                guard let decodedResponse = try? JSONDecoder().decode([Response].self, from: data) else { throw Constants.NetworkError.failedToDecodeResponse }
                return decodedResponse
            } catch Constants.NetworkError.badUrl {
                print("There was an error creating the URL")
            } catch Constants.NetworkError.badResponse {
                print("Did not get a valid response")
            } catch Constants.NetworkError.badStatus {
                print("Did not get a 2xx status code from the response")
            } catch Constants.NetworkError.failedToDecodeResponse {
                print("Failed to decode response into the given type")
            } catch {
                print("An error occured downloading the data")
            }
            
            return nil
        }
    }
}
