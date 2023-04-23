import CompanyMessangerCore
import UIKit

extension UIColor: BaseExtended {}

public extension BaseExtension where ExtendedType == UIColor {
    enum Colors {
        public static func color(named: String, in bundle: Bundle, compatibleWith traitCollection: UITraitCollection? = nil) -> UIColor? {
            .init(named: named, in: bundle, compatibleWith: traitCollection)
        }
    }
}
