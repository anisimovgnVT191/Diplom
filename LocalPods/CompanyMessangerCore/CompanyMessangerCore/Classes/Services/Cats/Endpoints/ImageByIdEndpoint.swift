import Apexy
import Foundation

struct ImageByIdEndpoint: JsonEndpoint, URLRequestBuildable {
    typealias Content = BreedImage
    
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    func makeRequest() -> URLRequest {
        let url = URL(string: RequestPaths.imageById.replacingOccurrences(of: "{id}", with: self.id))!
        return get(url)
    }
}
