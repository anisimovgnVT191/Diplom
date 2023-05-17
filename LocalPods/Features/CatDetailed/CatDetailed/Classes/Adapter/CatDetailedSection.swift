import Foundation

public struct CatDetailedSection {
    enum Id: String, Hashable {
        case images
        case descriptionCard
        case characteristics
    }
    
    enum Item {
        case imagesPager(item: BreedImagesPagerItemView.DisplayItem)
        case description(item: BreedDescriptionItemView.DisplayItem)
        case descriptionSpec
        case characteristic(item: BreedCharacteristicItemView.DisplayItem)
        case descriptionHeader(item: BreedDescriptionHeaderItemView.DisplayItem)
        
        case characteristicSkeleton
        case imagesPagerSkeleton
        case descriptionSkeleton
        case descriptionHeaderSkeleton
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
        case let .description(item):
            hasher.combine(item)
        case let .characteristic(item):
            hasher.combine(item)
        case let .descriptionHeader(item):
            hasher.combine(item)
        default:
            break
        }
    }
    
    static func == (lhs: CatDetailedSection.Item, rhs: CatDetailedSection.Item) -> Bool {
        switch (lhs, rhs) {
        case let (.imagesPager(lItem), .imagesPager(rItem)):
            return lItem == rItem
        case let (.characteristic(lItem), .characteristic(rItem)):
            return lItem == rItem
        case let (.descriptionHeader(lItem), .descriptionHeader(rItem)):
            return lItem == rItem
        case let (.description(lItem), .description(rItem)):
            return lItem == rItem
        default:
            return false
        }
    }
}
