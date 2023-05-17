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
        ).sink(receiveCompletion: { completion in
            print(completion)
        }, receiveValue: { [weak self] breed, breedImages in
            self?.updateView(breed: breed, breedImages: breedImages)
        })
    }
    
    private func updateView(breed: BreedDetailed, breedImages: [BreedImage]) {
        self.view?.setTitle(breed.name)
        
        self.view?.updateSections(
            with: [
                self.breedImagesSection(breedImages),
                self.breedDescription(breed),
                self.characteristicsSection(breed)
            ],
            animating: true
        )
    }
}

extension CatDetailedPresenter: CatDetailedViewOutput {
    func viewDidLoad() {
        self.view?.updateSections(
            with: [
                self.breedImagesSkeletonSection,
                self.breedDescriptionSkeleton,
                self.characteristicsSkeletonsSection
            ],
            animating: false
        )
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
    
    func breedDescription(_ breedDetailed: BreedDetailed) -> CatDetailedSection {
        .init(
            id: .descriptionCard,
            items: [
                .descriptionHeader(item: .init(title: .tic.Localized.CatDetailed.descriptionHeader())),
                .description(item: .init(description: breedDetailed.description))
            ]
        )
    }
    func characteristicsSection(_ breedDetailed: BreedDetailed) -> CatDetailedSection {
        .init(
            id: .characteristics,
            items: [
                .characteristic(item: .init(
                    title: .tic.Localized.CatDetailed.dogFriendly(),
                    characteristicRate: breedDetailed.dogFriendly
                )),
                .characteristic(item: .init(
                    title: .tic.Localized.CatDetailed.childFriendly(),
                    characteristicRate: breedDetailed.childFriendly
                )),
                .characteristic(item: .init(
                    title: .tic.Localized.CatDetailed.energyLevel(),
                    characteristicRate: breedDetailed.energyLevel
                )),
                .characteristic(item: .init(
                    title: .tic.Localized.CatDetailed.intelligence(),
                    characteristicRate: breedDetailed.intelligence
                )),
                .characteristic(item: .init(
                    title: .tic.Localized.CatDetailed.strangerFriendly(),
                    characteristicRate: breedDetailed.strangerFriendly
                )),
                .characteristic(item: .init(
                    title: .tic.Localized.CatDetailed.affectionLevel(),
                    characteristicRate: breedDetailed.affectionLevel
                ))
            ]
        )
    }
    
    var breedImagesSkeletonSection: CatDetailedSection {
        .init(
            id: .images,
            items: [.imagesPagerSkeleton]
        )
    }
    
    var breedDescriptionSkeleton: CatDetailedSection {
        .init(
            id: .descriptionCard,
            items: [
                .descriptionHeaderSkeleton,
                .descriptionSkeleton
            ]
        )
    }
    
    var characteristicsSkeletonsSection: CatDetailedSection {
        .init(
            id: .characteristics,
            items: (0...5).map { _ in .characteristicSkeleton }
        )
    }
}
