import UIKit

final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.cornerRadius = 16
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
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
