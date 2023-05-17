import UIKit

open class NavigationController: UINavigationController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = nil
        appearance.backgroundColor = .clear
        appearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        self.navigationBar.prefersLargeTitles = false
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
    }
}


