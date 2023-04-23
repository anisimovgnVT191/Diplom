import CompanyMessangerCore

protocol ChatsListCoordinatorOutput: AnyObject {
    
}

final class ChatsListCoordinator: BaseFlow {
    let rootViewController: UINavigationController
    weak var transitionHandler: TransitionHandler?
    weak var output: ChatsListCoordinatorOutput?
    
    init(rootViewController: UINavigationController, output: ChatsListCoordinatorOutput) {
        self.rootViewController = rootViewController
        self.transitionHandler = rootViewController
        self.output = output
    }
}

extension ChatsListCoordinator: Coordinator {
    func start() {
        
    }
}
