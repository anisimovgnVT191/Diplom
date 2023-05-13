import CatDetailed
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
        let view = ChatsListAssembley.makeModule(
            output: self,
            catsService: CatsService(client: RootDependencies.apiClient)
        )
        
        self.transitionHandler?.set([view], animated: false)
    }
    
    private func showCatDetailedViewController(for breedId: String) {
        let view = CatDetailedAssembley.makeModule(
            output: self,
            breedId: breedId,
            catsService: CatsService(client: RootDependencies.apiClient)
        ).configure { $0.hidesBottomBarWhenPushed = true }
        
        self.transitionHandler?.push(view, animated: true)
    }
}

extension ChatsListCoordinator: Coordinator {
    func start() {
        self.showChatsListViewController()
    }
}

extension ChatsListCoordinator: CatsListPresenterOutput {
    func didOpenDetailedCat(with id: String) {
        self.showCatDetailedViewController(for: id)
    }
}

extension ChatsListCoordinator: CatDetailedPresenterOutput {
    
}
