import UIKit

final class CatDetailedAdapter: NSObject {
    typealias Snapshot = NSDiffableDataSourceSnapshot<CatDetailedSection, CatDetailedSection.Item>
    typealias DataSource = UICollectionViewDiffableDataSource<CatDetailedSection, CatDetailedSection.Item>
    
    private var dataSource: DataSource?
    weak var collectionView: UICollectionView? {
        didSet {
            guard let collectionView else { return }
            
            self.registerCells()
            self.registerDecorationViews()
            self.dataSource = DataSource(collectionView: collectionView, cellProvider: self.makeCellProvider())
        }
    }
    
    private var orderedSections = [CatDetailedSection]()
    private let layoutBuilder: CatDetailedLayoutBuilder
    
    init(layoutBuilder: CatDetailedLayoutBuilder) {
        self.layoutBuilder = layoutBuilder
    }
    
    func compositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionNumber, env in
            guard let section = self.orderedSections[safe: sectionNumber] else { return nil }
            
            switch section.id {
            case .images:
                return self.layoutBuilder.buildImagesSection()
            case .characteristics:
                return self.layoutBuilder.buildCharacteristicSection()
            case .descriptionCard:
                return self.layoutBuilder.buildDescriptionSection()
            }
        }
    }
    
    func updateDataSource(with sections: [CatDetailedSection], animating: Bool) {
        self.orderedSections = sections
        var snapshot = Snapshot()
        
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        
        self.dataSource?.apply(snapshot, animatingDifferences: animating)
    }
    
    private func registerCells() {
        self.collectionView?.register(
            BreedImagesPagerItemView.Cell.self,
            forCellWithReuseIdentifier: BreedImagesPagerItemView.cellId
        )
        self.collectionView?.register(
            BreedCharacteristicItemView.Cell.self,
            forCellWithReuseIdentifier: BreedCharacteristicItemView.cellId
        )
        self.collectionView?.register(
            BreedDescriptionItemView.Cell.self,
            forCellWithReuseIdentifier: BreedDescriptionItemView.cellId
        )
        self.collectionView?.register(
            BreedDescriptionHeaderItemView.Cell.self,
            forCellWithReuseIdentifier: BreedDescriptionHeaderItemView.cellId
        )
        self.collectionView?.register(
            BreedCharacteristicsSkeletonItemView.Cell.self,
            forCellWithReuseIdentifier: BreedCharacteristicsSkeletonItemView.cellId
        )
        self.collectionView?.register(
            BreedImagesSkeletonItemView.Cell.self,
            forCellWithReuseIdentifier: BreedImagesSkeletonItemView.cellId
        )
        self.collectionView?.register(
            BreedDescriptionSkeletonItemView.Cell.self,
            forCellWithReuseIdentifier: BreedDescriptionSkeletonItemView.cellId
        )
        self.collectionView?.register(
            BreedDescriptionHeaderSkeletonItemView.Cell.self,
            forCellWithReuseIdentifier: BreedDescriptionHeaderSkeletonItemView.cellId
        )
    }
    
    private func registerDecorationViews() {
        self.collectionView?.collectionViewLayout.register(
            WhiteBackgroundWithShadowView.self,
            forDecorationViewOfKind: WhiteBackgroundWithShadowView.id
        )
    }
    
    private func makeCellProvider() -> DataSource.CellProvider {
        return { _, indexPath, item in
            self.cell(for: item, indexPath: indexPath)
        }
    }
    
    private func cell(for item: CatDetailedSection.Item, indexPath: IndexPath) -> UICollectionViewCell? {
        switch item {
        case let .imagesPager(imagesPagerItem):
            return self.imagesPagerCell(item: imagesPagerItem, indexPath: indexPath)
        case let .characteristic(characteristicItem):
            return self.characteristicCell(item: characteristicItem, indexPath: indexPath)
        case let .descriptionHeader(descriptionHeaderItem):
            return self.descriptionHeaderCell(item: descriptionHeaderItem, indexPath: indexPath)
        case let .description(descriptionItem):
            return self.descriptionCell(item: descriptionItem, indexPath: indexPath)
        case .characteristicSkeleton:
            return self.characteristicSkeletonCell(indexPath: indexPath)
        case .imagesPagerSkeleton:
            return self.imagesPagerSkeletonCell(indexPath: indexPath)
        case .descriptionSkeleton:
            return self.descriptionSkeletonCell(indexPath: indexPath)
        case .descriptionHeaderSkeleton:
            return self.descriptionHeaderSkeletonCell(indexPath: indexPath)
        default:
            return nil
        }
    }
    
    private func imagesPagerCell(
        item: BreedImagesPagerItemView.DisplayItem,
        indexPath: IndexPath
    ) -> UICollectionViewCell? {
        let cell = self.cell(
            BreedImagesPagerItemView.cellId,
            for: indexPath,
            type: BreedImagesPagerItemView.Cell.self
        )
        cell?.configure(with: item)
        return cell
    }
    
    private func characteristicCell(
        item: BreedCharacteristicItemView.DisplayItem,
        indexPath: IndexPath
    ) -> UICollectionViewCell? {
        let cell = self.cell(
            BreedCharacteristicItemView.cellId,
            for: indexPath,
            type: BreedCharacteristicItemView.Cell.self
        )
        cell?.configure(with: item)
        return cell
    }
    
    private func descriptionHeaderCell(
        item: BreedDescriptionHeaderItemView.DisplayItem,
        indexPath: IndexPath
    ) -> UICollectionViewCell? {
        let cell = self.cell(
            BreedDescriptionHeaderItemView.cellId,
            for: indexPath,
            type: BreedDescriptionHeaderItemView.Cell.self
        )
        cell?.configure(with: item)
        return cell
    }
    
    private func descriptionCell(
        item: BreedDescriptionItemView.DisplayItem,
        indexPath: IndexPath
    ) -> UICollectionViewCell? {
        let cell = self.cell(
            BreedDescriptionItemView.cellId,
            for: indexPath,
            type: BreedDescriptionItemView.Cell.self
        )
        cell?.configure(with: item)
        return cell
    }
    
    private func characteristicSkeletonCell(indexPath: IndexPath) -> UICollectionViewCell? {
        let cell = self.cell(
            BreedCharacteristicsSkeletonItemView.cellId,
            for: indexPath,
            type: BreedCharacteristicsSkeletonItemView.Cell.self
        )
        cell?.configure(with: .init())
        return cell
    }
    
    private func imagesPagerSkeletonCell(indexPath: IndexPath) -> UICollectionViewCell? {
        let cell = self.cell(
            BreedImagesSkeletonItemView.cellId,
            for: indexPath,
            type: BreedImagesSkeletonItemView.Cell.self
        )
        cell?.configure(with: .init())
        return cell
    }
    
    private func descriptionSkeletonCell(indexPath: IndexPath) -> UICollectionViewCell? {
        let cell = self.cell(
            BreedDescriptionSkeletonItemView.cellId,
            for: indexPath,
            type: BreedDescriptionSkeletonItemView.Cell.self
        )
        cell?.configure(with: .init())
        return cell
    }
    
    private func descriptionHeaderSkeletonCell(indexPath: IndexPath) -> UICollectionViewCell? {
        let cell = self.cell(
            BreedDescriptionHeaderSkeletonItemView.cellId,
            for: indexPath,
            type: BreedDescriptionHeaderSkeletonItemView.Cell.self
        )
        cell?.configure(with: .init())
        return cell
    }
    
    private func cell<T: UICollectionViewCell>(_ cellIdentifier: String, for indexPath: IndexPath, type: T.Type) -> T? {
        self.collectionView?.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? T
    }
}
