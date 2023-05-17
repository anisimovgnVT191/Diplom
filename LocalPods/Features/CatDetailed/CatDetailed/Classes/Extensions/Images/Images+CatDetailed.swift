import CompanyMessangerCore
import CompanyMessangerUIKit
import CompanyMessangerResources
import UIKit

extension BaseExtension.Images where ExtendedType == UIImage {
    enum CatDetailed {
        static func starSelected() -> UIImage? {
            Self.image(named: "star_selected")
        }
        
        static func starDeselected() -> UIImage? {
            Self.image(named: "star_deselected")
        }
        
        fileprivate static func image(named name: String, compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
            .init(named: name, in: .current, compatibleWith: traitCollection)
        }
    }
}
