import Foundation

final class CatsListLayoutBuilder {
    func buildCatsSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        ))
        item.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(0.5)
            ),
            subitem: item,
            count: 2
        )
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = .init(top: 16, leading: 8, bottom: 16, trailing: 8)
        
        return section
    }
}
