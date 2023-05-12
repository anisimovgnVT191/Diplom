import Apexy
import CompanyMessangerCore
import Foundation

struct BreedsEndpoint: JsonEndpoint, URLRequestBuildable {
    typealias Content = [Breed]
    
    private let page: Int
    private let limit: Int
    
    public init(page: Int, limit: Int) {
        self.page = page
        self.limit = limit
    }
    
    func makeRequest() throws -> URLRequest {
        var components = URLComponents(string: RequestPaths.breeds)!
        components.queryItems = [
            .init(name: "limit", value: String(self.limit)),
            .init(name: "page", value: String(self.page))
        ]
        
        let url = try components.asURL()
        
        return get(url)
    }
}
