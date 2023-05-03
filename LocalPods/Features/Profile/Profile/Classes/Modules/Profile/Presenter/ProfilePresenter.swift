import Foundation

final class ProfilePresenter {
    weak var view: ProfileViewInput?
    weak var output: ProfilePresenterOutput?
}

extension ProfilePresenter: ProfileViewOutput {}
