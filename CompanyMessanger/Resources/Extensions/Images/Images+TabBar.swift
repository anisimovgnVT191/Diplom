import CompanyMessangerCore
import CompanyMessangerResources

extension BaseExtension.Images where ExtendedType == UIImage {
    enum TabBar {
        static func list() -> UIImage? {
            Self.image(named: "list")
        }
        
        static func listSelected() -> UIImage? {
            Self.image(named: "list_selected")
        }
        
        static func profile() -> UIImage? {
            Self.image(named: "profile")
        }
        
        static func profileSelected() -> UIImage? {
            Self.image(named: "profile_selected")
        }
        
        fileprivate static func image(named name: String, compatibleWith traitCollection: UITraitCollection? = nil) -> UIImage? {
            .init(named: name, in: .main, compatibleWith: traitCollection)
        }
    }
}
