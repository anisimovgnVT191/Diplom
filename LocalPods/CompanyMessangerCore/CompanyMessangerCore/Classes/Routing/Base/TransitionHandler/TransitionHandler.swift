import UIKit

public protocol TransitionHandler: AnyObject {
    func present(_ viewController: UIViewController, animated: Bool, completion: ClosureVoid?)
    
    func presentOnTop(_ viewController: UIViewController, animated: Bool, completion: ClosureVoid?)
    
    func presentAsChild(_ viewController: UIViewController, on parentViewController: UIViewController)
    
    func dismiss(animated: Bool, completion: ClosureVoid?)
    
    func push(_ viewController: UIViewController, animated: Bool, completion: ClosureVoid?)
    
    func pushWithCustomTransition(_ viewController: UIViewController, transition: CATransition, completion: ClosureVoid?)
    
    func pop(animated: Bool, completion: ClosureVoid?)
    
    func popTo(_ viewController: UIViewController, animated: Bool, completion: ClosureVoid?)
    
    func popToSelf(animated: Bool, completion: ClosureVoid?)
    
    func popToRoot(animated: Bool, completion: ClosureVoid?)
    
    func set(_ viewControllers: [UIViewController], animated: Bool)
}
