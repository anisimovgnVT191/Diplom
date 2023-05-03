import Foundation

public enum ChatsListAssembley {
    public static func makeModule(output: ChatsListPresenterOutput) -> ChatsListViewController {
        let presenter = ChatsListPresenter()
        let view = ChatsListViewController(output: presenter)
        
        presenter.view = view
        presenter.output = output
        
        return view
    }
}
