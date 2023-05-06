import Foundation

public protocol ConfigurableView: AnyObject {
    associatedtype DisplayItem: Hashable
    
    func configure(with item: DisplayItem)
}
