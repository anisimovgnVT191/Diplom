import Foundation

public protocol Coordinator: AnyObject {
    func start()
}

open class BaseFlow {
    public final private(set) var coordinators: [Coordinator] = []
    
    public init() { }
    
    public final func add(_ coordinator: Coordinator) {
        self.coordinators.append(coordinator)
    }
    
    public final func remove(_ coordinator: Coordinator) {
        self.coordinators.removeAll(where: { $0 === coordinator })
    }
    
    public final func removeAllCoordinators() {
        self.coordinators.removeAll()
    }
}
