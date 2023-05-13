import UIKit

protocol CatsListAdapterDelegate: AnyObject {
    func didSelectItem(_ item: CatsListSection.Item, at index: Int)
}

final class CatsListAdapter: NSObject {
    typealias DataSource = UICollectionViewDiffableDataSource<CatsListSection, CatsListSection.Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<CatsListSection, CatsListSection.Item>
    
    weak var delegate: CatsListAdapterDelegate?
    weak var collectionView: UICollectionView? {
        didSet {
            guard let collectionView = self.collectionView else { return }
            
            collectionView.delegate = self
            self.registerCells()
            self.dataSource = DataSource(collectionView: collectionView, cellProvider: self.makeCellProvider())
        }
    }
    
    private var dataSource: DataSource?
    private var orderedSections = [CatsListSection]()
    private let layoutBuilder: CatsListLayoutBuilder
    
    init(layoutBuilder: CatsListLayoutBuilder) {
        self.layoutBuilder = layoutBuilder
    }
    
    func updateDataSource(_ sections: [CatsListSection], animating: Bool) {
        self.orderedSections = sections
        
        var snapshot = Snapshot()
        
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        
        self.dataSource?.apply(snapshot, animatingDifferences: animating)
    }
    
    func compositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionNumber, _ in
            guard let section = self.orderedSections[safe: sectionNumber] else { return nil }
            
            switch section.id {
            case .cats:
                return self.layoutBuilder.buildCatsSection()
            }
        }
    }
    
    private func registerCells() {
        self.collectionView?.register(CatCardItemView.Cell.self, forCellWithReuseIdentifier: CatCardItemView.cellId)
    }
    
    private func makeCellProvider() -> DataSource.CellProvider {
        return { _, indexPath, item in
            self.cell(for: item, indexPath: indexPath)
        }
    }
    
    private func cell(for item: CatsListSection.Item, indexPath: IndexPath) -> UICollectionViewCell? {
        switch item {
        case let .cat(catItem):
            return self.catCell(item: catItem, indexPath: indexPath)
        }
    }
    
    private func catCell(item: CatCardItemView.DisplayItem, indexPath: IndexPath) -> UICollectionViewCell? {
        let cell = self.cell(CatCardItemView.cellId, for: indexPath, type: CatCardItemView.Cell.self)
        cell?.configure(with: item)
        return cell
    }
    
    private func cell<T: UICollectionViewCell>(_ cellIdentifier: String, for indexPath: IndexPath, type: T.Type) -> T? {
        self.collectionView?.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? T
    }
}

extension CatsListAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = self.orderedSections[safe: indexPath.section]?.items[indexPath.item] else { return }
        
        self.delegate?.didSelectItem(item, at: indexPath.item)
    }
}
