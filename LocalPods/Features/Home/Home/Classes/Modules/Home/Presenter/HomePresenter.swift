import Foundation

final class HomePresenter {
    weak var view: HomeViewInput?
    weak var output: HomePresenterOutput?
}

extension HomePresenter: HomeViewOutput {}
