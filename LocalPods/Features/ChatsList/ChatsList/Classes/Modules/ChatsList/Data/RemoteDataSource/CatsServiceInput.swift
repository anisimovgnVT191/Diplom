import Combine
import Foundation

protocol CatsRemoteSource: AnyObject {
    func getBreeds(offset: Int, limit: Int) -> any Publisher<[BreedBase], Error>
    
    func getBreed(by id: String) -> any Publisher<BreedDetailed, Error>
    
    func getImage(by id: String)
}

