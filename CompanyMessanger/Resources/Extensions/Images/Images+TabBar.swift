import CompanyMessangerCore
import CompanyMessangerResources

extension BaseExtension.Images where ExtendedType == UIImage {
    enum TabBar {
        fileprivate static func image(named name: String, compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
            .init(named: "TabBar/\(name)", in: .main, compatibleWith: traitCollection)
        }
    }
}
