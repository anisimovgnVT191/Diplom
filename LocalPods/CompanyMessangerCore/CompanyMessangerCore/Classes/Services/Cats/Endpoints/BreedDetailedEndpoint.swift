import Apexy
import Foundation

struct BreedDetailedEndpoint: JsonEndpoint, URLRequestBuildable {
    typealias Content = BreedDetailed
    
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    func makeRequest() -> URLRequest {
        let url = URL(string: RequestPaths.breedDetailed.replacingOccurrences(of: "{id}", with: self.id))!
        return get(url)
    }
}
