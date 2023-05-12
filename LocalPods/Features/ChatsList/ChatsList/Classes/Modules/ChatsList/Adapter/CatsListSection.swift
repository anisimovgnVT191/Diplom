import Foundation

public struct CatsListSection {
    enum Id: String, Hashable {
        case cats
    }
    
    enum Item {
        case cat(item: CatCardItemView.DisplayItem)
    }
    
    let id: Id
    let items: [Item]
}

extension CatsListSection: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    public static func == (lhs: CatsListSection, rhs: CatsListSection) -> Bool {
        lhs.id == rhs.id
    }
}

extension CatsListSection.Item: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case let .cat(item):
            hasher.combine(item)
        }
    }
    
    static func == (lhs: CatsListSection.Item, rhs: CatsListSection.Item) -> Bool {
        switch (lhs, rhs) {
        case let (.cat(lItem), .cat(rItem)):
            return lItem == rItem
        }
    }
}
