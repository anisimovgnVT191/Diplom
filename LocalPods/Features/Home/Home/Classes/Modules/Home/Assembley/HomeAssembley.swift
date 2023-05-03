import Foundation

public enum HomeAssembley {
    public static func makeModule(output: HomePresenterOutput) -> HomeViewController {
        let presenter = HomePresenter()
        let view = HomeViewController(output: presenter)
        
        presenter.view = view
        presenter.output = output
        
        return view
    }
}
