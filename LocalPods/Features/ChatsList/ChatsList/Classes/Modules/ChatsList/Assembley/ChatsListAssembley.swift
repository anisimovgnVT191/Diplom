import CompanyMessangerCore
import Foundation

public enum ChatsListAssembley {
    public static func makeModule(
        output: CatsListPresenterOutput,
        catsService: CatsServiceInput
    ) -> ChatsListViewController {
        let presenter = CatsListPresenter(catsPaginator: .init(catsService: catsService))
        let view = ChatsListViewController(
            output: presenter,
            collectionAdapter: CatsListAdapter(layoutBuilder: .init())
        )
        
        presenter.view = view
        presenter.output = output
        
        return view
    }
}
