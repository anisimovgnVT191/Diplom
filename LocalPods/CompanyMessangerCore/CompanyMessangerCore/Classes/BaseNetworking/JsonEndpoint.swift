import Apexy
import Foundation

public protocol JsonEndpoint: Endpoint where Content: Decodable {}

extension JsonEndpoint {
    public func content(from response: URLResponse?, with body: Data) throws -> Content {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        print(response?.url?.query)
        print((response as? HTTPURLResponse)?.allHeaderFields)
        print((response as? HTTPURLResponse)?.statusCode)
        print((response as? HTTPURLResponse)?.mimeType)
        return try decoder.decode(Content.self, from: body)
    }
}
