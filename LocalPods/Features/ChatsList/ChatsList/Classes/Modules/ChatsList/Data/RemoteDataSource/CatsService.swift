import Apexy
import Combine
import Foundation

public final class CatsService: CatsServiceInput {
    private let client: Client
    
    public init(client: Client) {
        self.client = client
    }
    
    public func getBreeds(page: Int, limit: Int) -> AnyPublisher<[Breed], Error> {
        self.client.request(BreedsEndpoint(page: page, limit: limit))
    }
    
    public func getBreed(by id: String) -> AnyPublisher<BreedDetailed, Error> {
        self.client.request(BreedDetailedEndpoint(id: id))
    }
    
    public func getImage(by id: String) -> AnyPublisher<BreedImage, Error> {
        self.client.request(ImageByIdEndpoint(id: id))
    }
}



