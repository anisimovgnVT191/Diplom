import CompanyMessangerCore
import UIKit

public extension BaseExtension.Images where ExtendedType == UIImage {
    enum Common {
        public static func favoritesSelected() -> UIImage? {
            BaseExtension.Images.image(named: "favorites_selected", in: .current)
        }
        
        public static func favoritesDeselected() -> UIImage? {
            BaseExtension.Images.image(named: "favorites_deselected", in: .current)
        }
    }
}



