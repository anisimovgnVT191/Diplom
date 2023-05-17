import UIKit

final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.layer.masksToBounds = false
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.layer.shadowOffset = .zero
        self.tabBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        self.tabBar.layer.shadowRadius = 30
        self.tabBar.layer.shadowOpacity = 1
        
        let appearance = UITabBarAppearance()
        let itemAppearance = UITabBarItemAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .tic.Colors.TabBar.background
        
        appearance.inlineLayoutAppearance = itemAppearance
        appearance.stackedLayoutAppearance = itemAppearance
        appearance.compactInlineLayoutAppearance = itemAppearance
        
        self.tabBar.standardAppearance = appearance
        self.tabBar.unselectedItemTintColor = .tic.Colors.TabBar.itemTint
        if #available(iOS 15, *) {
            self.tabBar.scrollEdgeAppearance = appearance
        }
    }
}
