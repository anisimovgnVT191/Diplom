import CompanyMessangerCore
import UIKit

final class TabBarCoordinator: BaseFlow {
    weak var transitionHandler: TransitionHandler?
    
    private let viewController: UITabBarController
    
    init(viewController: UITabBarController) {
        self.viewController = viewController
        self.transitionHandler = viewController
    }
    
    private func makeHomeModule() -> UIViewController {
        let coordinator = HomeCoordinatorAssembly.makeModule(
            with: UINavigationController(),
            output: self
        )
        
        self.add(coordinator)
        coordinator.start()
        return coordinator.rootViewController
    }
    
    private func makeChatsListModule() -> UIViewController {
        let coodinator = ChatsListCoordinatorAssembly.makeModule(
            with: UINavigationController(),
            output: self
        )
        
        self.add(coodinator)
        coodinator.start()
        return coodinator.rootViewController
    }
    
    private func makeProfileModule() -> UIViewController {
        let coordinator = ProfileCoordinatorAssembly.makeModule(
            with: UINavigationController(),
            output: self
        )
        
        self.add(coordinator)
        coordinator.start()
        return coordinator.rootViewController
    }
    
    private func makeTabBarItem(image: UIImage, selectedImage: UIImage) -> UITabBarItem {
        .init(title: nil, image: image, selectedImage: selectedImage)
    }
}

extension TabBarCoordinator: Coordinator {
    func start() {
        self.viewController.setViewControllers(
            [self.makeHomeModule(), self.makeChatsListModule(), self.makeProfileModule()],
            animated: true
        )
    }
}

extension TabBarCoordinator: HomeCoordinatorOutput {}

extension TabBarCoordinator: ChatsListCoordinatorOutput {}

extension TabBarCoordinator: ProfileCoordinatorOutput {}
