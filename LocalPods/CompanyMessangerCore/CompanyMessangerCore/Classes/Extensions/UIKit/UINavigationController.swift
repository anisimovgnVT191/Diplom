import UIKit

public extension UINavigationController {
    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: ClosureVoid? = nil) {
        self.performNavigation(
            self.pushViewController(viewController, animated: animated),
            animated: animated,
            completion: completion
        )
    }
    
    @discardableResult func popViewController(animated: Bool, completion: ClosureVoid? = nil) -> UIViewController? {
        self.performNavigation(self.popViewController(animated: animated), animated: animated, completion: completion)
    }
    
    @discardableResult func popToViewController(_ viewController: UIViewController,
                                                animated: Bool,
                                                completion: ClosureVoid? = nil) -> [UIViewController]? {
        self.performNavigation(
            self.popToViewController(viewController, animated: animated),
            animated: animated,
            completion: completion
        )
    }
    
    @discardableResult func popToRootViewController(animated: Bool, completion: ClosureVoid? = nil) -> [UIViewController]? {
        self.performNavigation(
            self.popToRootViewController(animated: animated),
            animated: animated,
            completion: completion
        )
    }
    
    private func performNavigation<Result>(_ navigationAction: @autoclosure ResultClosure<Result>,
                                           animated: Bool,
                                           completion: ClosureVoid?) -> Result {
        let result = navigationAction()
        
        if animated,
           let transitionCoordinator = self.transitionCoordinator {
            transitionCoordinator.animate(alongsideTransition: nil, completion: { _ in completion?() })
        } else {
            DispatchQueue.main.async { completion?() }
        }
        
        return result
    }
}

public extension UINavigationItem {
    func removeNextBackButtonTitle() {
        let backItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem = backItem
    }
}
