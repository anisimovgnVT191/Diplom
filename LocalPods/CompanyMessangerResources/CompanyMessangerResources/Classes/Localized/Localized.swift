import Foundation
import CompanyMessangerCore

extension String: BaseExtended {}

public extension BaseExtension where ExtendedType == String {
    enum Localized {
        public static func string(key: String, tableName: String? = nil, bundle: Bundle, arguments: [CVarArg] = []) -> String {
            let localizedString = NSLocalizedString(key, tableName: tableName, bundle: bundle, comment: "")
            
            return String(format: localizedString, locale: .current, arguments: arguments)
        }
    }
}
