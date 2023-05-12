import Foundation

public struct Breed: BreedBase {
    public let id: String
    public let name: String
    public let referenceImageId: String?
}

public protocol BreedBase: Decodable {
    var id: String { get }
    var name: String { get }
    var referenceImageId: String? { get }
}
