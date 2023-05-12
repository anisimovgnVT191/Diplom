import Combine
import Foundation

public protocol CatsServiceInput: AnyObject {
    func getBreeds(page: Int, limit: Int) -> AnyPublisher<[Breed], Error>
    
    func getBreed(by id: String) -> AnyPublisher<BreedDetailed, Error>
    
    func getImage(by id: String) -> AnyPublisher<BreedImage, Error>
}

