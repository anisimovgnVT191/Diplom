import Combine
import CompanyMessangerCore
import Foundation

final class CatsListPresenter {
    weak var view: CatsListViewInput?
    weak var output: CatsListPresenterOutput?
    
    private var breedsCansalable: AnyCancellable?
    private var breeds = [BreedBase]() {
        didSet {
            self.updateView()
        }
    }
    
    private let catsPaginator: CatsPaginator
    
    init(catsPaginator: CatsPaginator) {
        self.catsPaginator = catsPaginator
    }
    
    private func updateView() {
        self.view?.updateSections([self.catsSection], animating: true)
    }
    
    private func toggleFavorite(for catId: String) {
        
    }
    
    private func observeCatsPaginator() {
        self.breedsCansalable = self.catsPaginator
            .observeItems()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in }, receiveValue: { [weak self] breeds in
                self?.breeds = breeds
            })
    }
}

extension CatsListPresenter: CatsListViewOutput {
    func viewDidLoad() {
        self.observeCatsPaginator()
        self.view?.updateSections([self.catsSkeletonsSections], animating: false)
        self.catsPaginator.loadNextItems()
    }
    
    func onCatTapped(at index: Int) {
        guard let catId = self.catsPaginator.items[safe: index]?.id else { return }
        
        self.output?.didOpenDetailedCat(with: catId)
    }
    
    func onScrollPassBottomItems() {
        guard self.catsPaginator.canLoadNextItems else { return }
        
        self.catsPaginator.loadNextItems()
    }
}

private extension CatsListPresenter {
    var catsSection: CatsListSection {
        .init(
            id: .cats,
            items: self.breeds.map { breed in .cat(item: .init(
                imageUrl: breed.referenceImageId ?? "",
                isFavorite: false,
                breedTitle: breed.name,
                didTapFavorite: { [weak self] in self?.toggleFavorite(for: breed.id) }
            )) }
        )
    }
    var catsSkeletonsSections: CatsListSection {
        .init(
            id: .cats,
            items: (0...5).map { _ in .catSkeleton }
        )
    }
}
