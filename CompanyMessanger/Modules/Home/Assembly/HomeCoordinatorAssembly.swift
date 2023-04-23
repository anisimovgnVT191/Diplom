import UIKit

enum HomeCoordinatorAssembly {
    static func makeModule(
        with rootViewController: UINavigationController,
        output: HomeCoordinatorOutput
    ) -> HomeCoordinator {
        .init(rootViewController: rootViewController, output: output)
    }
}
