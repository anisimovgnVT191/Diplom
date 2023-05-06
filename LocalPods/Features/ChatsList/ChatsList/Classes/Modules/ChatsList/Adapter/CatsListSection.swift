import Foundation

struct CatsListSection {
    enum Id: String, Hashable {
        case cats
    }
    
    enum Item {
        case cat
    }
    
    let id: Id
    let items: [Item]
}
