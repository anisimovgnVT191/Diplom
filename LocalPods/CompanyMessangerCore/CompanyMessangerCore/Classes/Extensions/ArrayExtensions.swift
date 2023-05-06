import Foundation

public extension Array {
    subscript(safe index: Int) -> Element? {
        guard self.indices.contains(index) else { return nil }
        
        return self[index]
    }
}
