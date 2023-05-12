import Combine
import Foundation

public final class CatsPaginator {
    private let subject: PassthroughSubject<[BreedBase], Error> = .init()
    private let pageSize = 10
    
    private var disposeBag = [AnyCancellable]()
    private var currentPageNumber = 0
    private var canLoadNextItems = true
    
    private(set) var items = [BreedBase]() {
        didSet {
            self.subject.send(items)
        }
    }
    
    private let catsService: CatsServiceInput
    
    init(catsService: CatsServiceInput) {
        self.catsService = catsService
    }
    
    public func loadNextItems() {
        guard self.canLoadNextItems else { return }
        
        self.currentPageNumber += 1
        self.loadCats()
    }
    
    public func observeItems() -> AnyPublisher<[BreedBase], Error> {
        return self.subject.eraseToAnyPublisher()
    }
    
    private func loadCats() {
        self.catsService
            .getBreeds(page: self.currentPageNumber, limit: self.pageSize)
            .flatMap { return Publishers.Sequence<[Breed], Error>(sequence: $0) }
            .flatMap { [weak self] breed in
                guard let self,
                      let imageId = breed.referenceImageId
                else { return Just(breed).setFailureType(to: Error.self).eraseToAnyPublisher() }
                
                return self.catsService
                    .getImage(by: imageId)
                    .map { return Breed(id: breed.id, name: breed.name, referenceImageId: $0.url) }
                    .eraseToAnyPublisher()
            }
            .collect()
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [weak self] breeds in
                guard let self else { return }
                
                self.canLoadNextItems = !breeds.isEmpty
                self.items = breeds
            }).store(in: &self.disposeBag)
    }
}
