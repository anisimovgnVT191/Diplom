import CompanyMessangerCore

protocol HomeCoordinatorOutput: AnyObject {
    
}

final class HomeCoordinator: BaseFlow {
    let rootViewController: UINavigationController
    weak var transitionHandler: TransitionHandler?
    weak var output: HomeCoordinatorOutput?
    
    init(rootViewController: UINavigationController, output: HomeCoordinatorOutput) {
        self.rootViewController = rootViewController
        self.transitionHandler = rootViewController
        self.output = output
    }
}

extension HomeCoordinator: Coordinator {
    func start() {
        
    }
}
