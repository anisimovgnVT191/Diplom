import Foundation

private final class CatDetailed {}

internal extension Bundle {
    static let current: Bundle = {
        let bundle = Bundle(for: CatDetailed.self)

        guard let resourceBundleURL = bundle.url(forResource: "CatDetailed", withExtension: "bundle"),
              let resourceBundle = Bundle(url: resourceBundleURL)
        else {
            fatalError("Cannot access CatDetailed resource bundle.")
        }

        return resourceBundle
    }()
}

public extension Bundle {
    static let sharedResources = Bundle.current
}
