import Alamofire
import Foundation

final class AppRequestInterceptor: RequestInterceptor {
    private let baseUrlString = Bundle.main.object(forInfoDictionaryKey: "baseUrl") as! String
    private let apiKey = Bundle.main.object(forInfoDictionaryKey: "apiKey") as! String
    
    private var baseUrl: URL {
        URL(string: self.baseUrlString)!
    }
    
    func adapt(
        _ urlRequest: URLRequest,
        for session: Alamofire.Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void
    ) {
        guard let url = urlRequest.url else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        var request = urlRequest
        
        request.url = appendingBaseURL(to: url)
        request.setValue(self.apiKey, forHTTPHeaderField: "x-api-key")
        
        let query = request.url?.query
        completion(.success(request))
    }
    
    private func appendingBaseURL(to url: URL) -> URL {
        URL(string: url.absoluteString, relativeTo: self.baseUrl)!
    }
}
