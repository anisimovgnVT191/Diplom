import UIKit

extension UIViewController: TransitionHandler {
    private var asNavigationController: UINavigationController? {
        (self as? UINavigationController) ?? self.navigationController
    }
    
    public func presentOnTop(_ viewController: UIViewController, animated: Bool, completion: ClosureVoid?) {
        var controller: UIViewController = self
        while let presentedViewController = controller.presentedViewController, !presentedViewController.isBeingDismissed {
            controller = presentedViewController
        }
        controller.present(viewController, animated: animated, completion: completion)
    }
    
    public func presentAsChild(_ viewController: UIViewController, on parentViewController: UIViewController) {
        parentViewController.addChild(viewController)
        parentViewController.view.addSubviewWithSimpleLayout(viewController.view)
        parentViewController.view.sendSubviewToBack(viewController.view)
        viewController.didMove(toParent: parentViewController)
    }
    
    public func push(_ viewController: UIViewController, animated: Bool, completion: ClosureVoid?) {
        self.asNavigationController?.pushViewController(viewController, animated: animated, completion: completion)
    }
    
    public func pushWithCustomTransition(_ viewController: UIViewController, transition: CATransition, completion: ClosureVoid?) {
        self.asNavigationController?.view.layer.add(transition, forKey: nil)
        self.push(viewController, animated: false, completion: completion)
    }
    
    public func pop(animated: Bool, completion: ClosureVoid?) {
        self.asNavigationController?.popViewController(animated: animated, completion: completion)
    }
    
    public func popTo(_ viewController: UIViewController, animated: Bool, completion: ClosureVoid?) {
        self.asNavigationController?.popToViewController(viewController, animated: animated, completion: completion)
    }
    
    public func popToSelf(animated: Bool, completion: ClosureVoid?) {
        self.asNavigationController?.popToViewController(self, animated: animated, completion: completion)
    }
    
    public func popToRoot(animated: Bool, completion: ClosureVoid?) {
        self.asNavigationController?.popToRootViewController(animated: animated, completion: completion)
    }
    
    public func set(_ viewControllers: [UIViewController], animated: Bool) {
        self.asNavigationController?.setViewControllers(viewControllers, animated: animated)
    }
}
