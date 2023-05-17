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
                heightDimension: .fractionalHeight(1.0/2.0)
            ),
            subitems: [item]
        )
        
        return .init(group: group)
    }
    
    func buildCharacteristicSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(48)
            )
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(48))
            ,
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        let background = NSCollectionLayoutDecorationItem.background(elementKind: WhiteBackgroundWithShadowView.id)
        
        background.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 16)
        
        section.interGroupSpacing = 8
        section.contentInsets = .init(top: 32, leading: 32, bottom: 16, trailing: 32)
        section.decorationItems = [background]
        
        return section
    }
    
    func buildDescriptionSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(38)
            )
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(38)
            ),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        let background = NSCollectionLayoutDecorationItem.background(elementKind: WhiteBackgroundWithShadowView.id)
        
        
        background.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 16)
        
        section.interGroupSpacing = 12
        section.contentInsets = .init(top: 32, leading: 32, bottom: 16, trailing: 32)
        section.decorationItems = [background]
        
        return section
    }
}
