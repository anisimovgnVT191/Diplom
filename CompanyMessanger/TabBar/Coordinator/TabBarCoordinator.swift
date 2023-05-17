import CompanyMessangerCore
import CompanyMessangerUIKit
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
            with: NavigationController(),
            output: self
        )
        
        self.add(coordinator)
        coordinator.start()
        return coordinator.rootViewController
    }
    
    private func makeChatsListModule() -> UIViewController {
        let coodinator = ChatsListCoordinatorAssembly.makeModule(
            with: NavigationController(),
            output: self
        )
        
        coodinator.rootViewController.tabBarItem = self.makeTabBarItem(
            image: .tic.Images.TabBar.list(),
            selectedImage: .tic.Images.TabBar.listSelected()
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
        
        coordinator.rootViewController.tabBarItem = self.makeTabBarItem(
            image: .tic.Images.TabBar.profile(),
            selectedImage: .tic.Images.TabBar.profileSelected()
        )
        self.add(coordinator)
        coordinator.start()
        return coordinator.rootViewController
    }
    
    private func makeTabBarItem(image: UIImage?, selectedImage: UIImage?) -> UITabBarItem {
        let tabBarItem: UITabBarItem = .init(title: nil, image: image, selectedImage: selectedImage)
        tabBarItem.imageInsets = .init(top: 10, left: 0, bottom: -10, right: 0)
        
        return tabBarItem
    }
}

extension TabBarCoordinator: Coordinator {
    func start() {
        self.viewController.setViewControllers(
            [self.makeChatsListModule(), self.makeProfileModule()],
            animated: true
        )
    }
}

extension TabBarCoordinator: HomeCoordinatorOutput {}

extension TabBarCoordinator: ChatsListCoordinatorOutput {}

extension TabBarCoordinator: ProfileCoordinatorOutput {}
