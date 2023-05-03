import Foundation

final class ChatsListPresenter {
    weak var view: ChatsListViewInput?
    weak var output: ChatsListPresenterOutput?
}

extension ChatsListPresenter: ChatsListViewOutput {
}
