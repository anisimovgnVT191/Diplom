import Foundation

protocol CatDetailedViewOutput: AnyObject {
    func viewDidLoad()
}

protocol CatDetailedViewInput: AnyObject {
    func updateSections(with sections: [CatDetailedSection], animating: Bool)
}
