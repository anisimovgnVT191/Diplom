import Foundation

final class ChatsListPresenter {
    weak var view: ChatsListViewInput?
    weak var output: ChatsListPresenterOutput?
    
    private let catsServiceInput: CatsServiceInput
    
    init(catsServiceInput: CatsServiceInput) {
        self.catsServiceInput = catsServiceInput
    }
    
    
}

extension ChatsListPresenter: ChatsListViewOutput {
    func viewDidLoad() {
        
    }
    
    func onCatTapped(at index: Int) {
        
    }
}
