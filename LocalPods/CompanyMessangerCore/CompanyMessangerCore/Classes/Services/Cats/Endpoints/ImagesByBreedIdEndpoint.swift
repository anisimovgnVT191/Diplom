import Apexy
import Foundation

struct ImagesByBreedIdEndpoint: JsonEndpoint, URLRequestBuildable {
    typealias Content = [BreedImage]
    
    let breedId: String
    
    init(breedId: String) {
        self.breedId = breedId
    }
    
    func makeRequest() throws -> URLRequest {
        var urlComponents = URLComponents(string: RequestPaths.imagesByBreedId)!
        
        urlComponents.queryItems = [
            .init(name: "has_breeds", value: "1"),
            .init(name: "limit", value: "7"),
            .init(name: "breed_ids", value: breedId)
        ]
        
        let url = try urlComponents.asURL()
        
        return get(url)
    }
}
