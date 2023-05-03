import Foundation

public enum ProfileAssembley {
    public static func makeModule(output: ProfilePresenterOutput) -> ProfileViewController {
        let presenter = ProfilePresenter()
        let view = ProfileViewController(output: presenter)
        
        presenter.view = view
        presenter.output = output
        
        return view
    }
}
