import UIKit

final class CatDetailedAdapter: NSObject {
    typealias Snapshot = NSDiffableDataSourceSnapshot<CatDetailedSection, CatDetailedSection.Item>
    typealias DataSource = UICollectionViewDiffableDataSource<CatDetailedSection, CatDetailedSection.Item>
    
    private var dataSource: DataSource?
    weak var collectionView: UICollectionView? {
        didSet {
            guard let collectionView else { return }
            
            self.registerCells()
            self.dataSource = DataSource(collectionView: collectionView, cellProvider: self.makeCellProvider())
        }
    }
    
    private var orderedSections = [CatDetailedSection]()
    private let layoutBuilder: CatDetailedLayoutBuilder
    
    init(layoutBuilder: CatDetailedLayoutBuilder) {
        self.layoutBuilder = layoutBuilder
    }
    
    func compositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionNumber, _ in
            guard let section = self.orderedSections[safe: sectionNumber] else { return nil }
            
            switch section.id {
            case .images:
                return self.layoutBuilder.buildImagesSection()
            default:
                return nil
            }
        }
    }
    
    func updateDataSource(with sections: [CatDetailedSection], animating: Bool) {
        self.orderedSections = sections
        var snapshot = Snapshot()
        
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        
        self.dataSource?.apply(snapshot, animatingDifferences: false)
    }
    
    private func registerCells() {
        self.collectionView?.register(
            BreedImagesPagerItemView.Cell.self,
            forCellWithReuseIdentifier: BreedImagesPagerItemView.cellId
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
    private func cell<T: UICollectionViewCell>(_ cellIdentifier: String, for indexPath: IndexPath, type: T.Type) -> T? {
        self.collectionView?.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? T
    }
}
