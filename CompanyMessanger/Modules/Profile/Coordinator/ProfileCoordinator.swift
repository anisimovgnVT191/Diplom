import CompanyMessangerCore
import Profile

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
    
    private func showProfileViewController() {
        let view = ProfileAssembley.makeModule(output: self)
        
        self.transitionHandler?.set([view], animated: true)
    }
}

extension ProfileCoordinator: Coordinator {
    func start() {
        self.showProfileViewController()
    }
}

extension ProfileCoordinator: ProfilePresenterOutput {}
