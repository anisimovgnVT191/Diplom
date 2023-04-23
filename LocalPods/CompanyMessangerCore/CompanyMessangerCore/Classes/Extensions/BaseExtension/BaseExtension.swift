import Foundation

public struct BaseExtension<ExtendedType> {
    public private(set) var type: ExtendedType

    public init(_ type: ExtendedType) {
        self.type = type
    }
}

public protocol BaseExtended {
    associatedtype ExtendedType

    static var tic: BaseExtension<ExtendedType>.Type { get set }
    
    var tic: BaseExtension<ExtendedType> { get set }
}

public extension BaseExtended {
    static var tic: BaseExtension<Self>.Type {
        get { BaseExtension<Self>.self }
        set {}
    }
    
    var tic: BaseExtension<Self> {
        get { BaseExtension(self) }
        set {}
    }
}
