import UIKit

public extension TransitionHandler {
    func present(_ viewController: UIViewController, animated: Bool) {
        self.present(viewController, animated: animated, completion: nil)
    }
    
    func presentOnTop(_ viewController: UIViewController, animated: Bool) {
        self.presentOnTop(viewController, animated: animated, completion: nil)
    }
    
    func dismiss(animated: Bool) {
        self.dismiss(animated: animated, completion: nil)
    }
    
    func push(_ viewController: UIViewController, animated: Bool) {
        self.push(viewController, animated: animated, completion: nil)
    }
    
    func pushWithCustomTransition(_ viewController: UIViewController, transition: CATransition) {
        self.pushWithCustomTransition(viewController, transition: transition, completion: nil)
    }
    
    func pop(animated: Bool) {
        self.pop(animated: animated, completion: nil)
    }
    
    func popTo(_ viewController: UIViewController, animated: Bool) {
        self.popTo(viewController, animated: animated, completion: nil)
    }
    
    func popToSelf(animated: Bool) {
        self.popToSelf(animated: animated, completion: nil)
    }
    
    func popToRoot(animated: Bool) {
        self.popToRoot(animated: animated, completion: nil)
    }
}
