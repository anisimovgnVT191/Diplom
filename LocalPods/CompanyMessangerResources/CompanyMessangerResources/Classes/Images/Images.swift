import CompanyMessangerCore
import UIKit

extension UIImage: BaseExtended {}

public extension BaseExtension where ExtendedType == UIImage {
    enum Images {
        public static func image(named: String, in bundle: Bundle, compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
            .init(named: named, in: bundle, compatibleWith: traitCollection)
        }
    }
}
