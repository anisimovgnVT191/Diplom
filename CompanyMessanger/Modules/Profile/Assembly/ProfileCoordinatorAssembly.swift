import UIKit

enum ProfileCoordinatorAssembly {
    static func makeModule(
        with rootViewController: UINavigationController,
        output: ProfileCoordinatorOutput
    ) -> ProfileCoordinator {
        .init(rootViewController: rootViewController, output: output)
    }
}
