import Foundation

public protocol ChatsListViewInput: AnyObject {
    func updateSections(_ sections: [CatsListSection], animating: Bool)
}

public protocol ChatsListViewOutput: AnyObject {
    func viewDidLoad()
    
    func onCatTapped(at index: Int)
}
