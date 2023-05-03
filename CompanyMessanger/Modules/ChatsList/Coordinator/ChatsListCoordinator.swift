import ChatsList
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
    
    private func showChatsListViewController() {
        let view = ChatsListAssembley.makeModule(output: self)
        
        self.transitionHandler?.set([view], animated: false)
    }
}

extension ChatsListCoordinator: Coordinator {
    func start() {
        self.showChatsListViewController()
    }
}

extension ChatsListCoordinator: ChatsListPresenterOutput {}
