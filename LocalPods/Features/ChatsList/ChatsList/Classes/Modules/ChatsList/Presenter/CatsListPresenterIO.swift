import Foundation

public protocol CatsListPresenterInput: AnyObject {}

public protocol CatsListPresenterOutput: AnyObject {
    func didOpenDetailedCat(with id: String)
}
