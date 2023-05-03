import CompanyMessangerCore
import Home

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
    
    private func showHomeViewController() {
        let view = HomeAssembley.makeModule(output: self)
        
        self.transitionHandler?.set([view], animated: true)
    }
}

extension HomeCoordinator: Coordinator {
    func start() {
        self.showHomeViewController()
    }
}

extension HomeCoordinator: HomePresenterOutput {}
