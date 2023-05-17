import Foundation

protocol CatDetailedViewOutput: AnyObject {
    func viewDidLoad()
}

protocol CatDetailedViewInput: AnyObject {
    func setTitle(_ title: String)
    
    func updateSections(with sections: [CatDetailedSection], animating: Bool)
}
