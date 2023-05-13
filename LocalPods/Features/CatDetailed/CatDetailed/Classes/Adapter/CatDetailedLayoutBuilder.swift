import Foundation

final class CatDetailedLayoutBuilder {
    func buildImagesSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1.0/3.0)
            ),
            subitems: [item]
        )
        
        return .init(group: group)
    }
}
