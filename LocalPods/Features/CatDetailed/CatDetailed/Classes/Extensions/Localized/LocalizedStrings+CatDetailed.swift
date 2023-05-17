import CompanyMessangerCore
import CompanyMessangerResources
import Foundation

extension BaseExtension.Localized where ExtendedType == String {
    enum CatDetailed {
        static func descriptionHeader() -> String {
            Self.string(key: "Description.Title")
        }
        
        static func dogFriendly() -> String {
            Self.string(key: "DogFriendly")
        }
        
        static func childFriendly() -> String {
            Self.string(key: "ChildFriendly")
        }
        
        static func energyLevel() -> String {
            Self.string(key: "EnergyLevel")
        }
        
        static func intelligence() -> String {
            Self.string(key: "Intelligence")
        }
        
        static func strangerFriendly() -> String {
            Self.string(key: "StrangerFriendly")
        }
        
        static func affectionLevel() -> String {
            Self.string(key: "AffectionLevel")
        }
        
        fileprivate static func string(key: String, tableName: String? = nil, arguments: [CVarArg] = []) -> String {
            .tic.Localized.string(key: key, tableName: tableName, bundle: .current, arguments: arguments)
        }
    }
}
