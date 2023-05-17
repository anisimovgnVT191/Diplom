import Foundation

public protocol CatsListViewInput: AnyObject {
    func updateSections(_ sections: [CatsListSection], animating: Bool)
}

public protocol CatsListViewOutput: AnyObject {
    func viewDidLoad()
    
    func onCatTapped(at index: Int)
    
    func onScrollPassBottomItems()
}
