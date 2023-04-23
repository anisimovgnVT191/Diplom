import CompanyMessangerCore

protocol ProfileCoordinatorOutput: AnyObject {
    
}

final class ProfileCoordinator: BaseFlow {
    let rootViewController: UINavigationController
    weak var transitionHandler: TransitionHandler?
    weak var output: ProfileCoordinatorOutput?
    
    init(rootViewController: UINavigationController, output: ProfileCoordinatorOutput) {
        self.rootViewController = rootViewController
        self.transitionHandler = rootViewController
        self.output = output
    }
}

extension ProfileCoordinator: Coordinator {
    func start() {
        
    }
}
