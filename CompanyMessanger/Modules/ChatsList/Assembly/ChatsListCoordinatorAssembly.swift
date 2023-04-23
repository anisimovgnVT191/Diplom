import UIKit

enum ChatsListCoordinatorAssembly {
    static func makeModule(
        with rootViewController: UINavigationController,
        output: ChatsListCoordinatorOutput
    ) -> ChatsListCoordinator {
        .init(rootViewController: rootViewController, output: output)
    }
}
