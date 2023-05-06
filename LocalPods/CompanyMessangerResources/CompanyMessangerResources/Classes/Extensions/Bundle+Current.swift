import Foundation

private final class CompanyMessangerResources {}

internal extension Bundle {
    static let current: Bundle = {
        let bundle = Bundle(for: CompanyMessangerResources.self)

        guard let resourceBundleURL = bundle.url(forResource: "CompanyMessangerResources", withExtension: "bundle"),
              let resourceBundle = Bundle(url: resourceBundleURL)
        else {
            fatalError("Cannot access CompanyMessangerResources resource bundle.")
        }

        return resourceBundle
    }()
}

public extension Bundle {
    static let sharedResources = Bundle.current
}
