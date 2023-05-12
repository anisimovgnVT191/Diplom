import Foundation

public struct CatDetailedSection {
    enum Id: String, Hashable {
        case images
        case descriptionCard
        case characteristics
    }
    
    enum Item {
        case imagesPager(item: BreedImagesPagerItemView.DisplayItem)
        case description
        case descriptionSpec
        case characteristic
    }
    
    let id: Id
    let items: [Item]
}

extension CatDetailedSection: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    public static func == (lhs: CatDetailedSection, rhs: CatDetailedSection) -> Bool {
        lhs.id == rhs.id
    }
}

extension CatDetailedSection.Item: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case let .imagesPager(item):
            hasher.combine(item)
        case .description:
            break
        case .characteristic:
            break
        }
    }
    
    static func == (lhs: CatDetailedSection.Item, rhs: CatDetailedSection.Item) -> Bool {
        return false
    }
}
