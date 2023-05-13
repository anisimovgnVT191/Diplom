import CompanyMessangerCore
import Foundation

public enum CatDetailedAssembley {
    public static func makeModule(
        output: CatDetailedPresenterOutput,
        breedId: String,
        catsService: CatsServiceInput
    ) -> UIViewController {
        let presenter = CatDetailedPresenter(breedId: breedId, catsService: catsService)
        let view = CatDetailedViewController(output: presenter, collectionAdapter: .init(layoutBuilder: .init()))
        
        presenter.output = output
        presenter.view = view
        
        return view
    }
}
