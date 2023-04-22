public protocol Configurable {}

public extension Configurable {
    @discardableResult
    func configure(_ block: ArgumentsClosure<Self>) -> Self {
        block(self)
        return self
    }
}

extension NSObject: Configurable {}
