import Combine
import Foundation
import CompanyMessangerCore

final class CatDetailedPresenter {
    weak var view: CatDetailedViewInput?
    weak var output: CatDetailedPresenterOutput?
    
    private var contentCancalable: AnyCancellable?
    
    private let breedId: String
    private let catsService: CatsServiceInput
    
    init(breedId: String, catsService: CatsServiceInput) {
        self.breedId = breedId
        self.catsService = catsService
    }
    
    private func loadContent() {
        self.contentCancalable = Publishers.CombineLatest(
            self.catsService.getBreed(by: self.breedId),
            self.catsService.getImages(by: self.breedId)
        ).sink(receiveCompletion: {_ in }, receiveValue: { [weak self] breed, breedImages in
            self?.updateView(breed: breed, breedImages: breedImages)
        })
    }
    
    private func updateView(breed: BreedDetailed, breedImages: [BreedImage]) {
        self.view?.updateSections(with: [self.breedImagesSection(breedImages)], animating: false)
    }
}

extension CatDetailedPresenter: CatDetailedViewOutput {
    func viewDidLoad() {
        self.loadContent()
    }
}

private extension CatDetailedPresenter {
    func breedImagesSection(_ breedImages: [BreedImage]) -> CatDetailedSection {
        .init(
            id: .images,
            items: [.imagesPager(item: .init(imagesUrls: breedImages.map(\.url)))]
        )
    }
}
