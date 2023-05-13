public protocol BreedBase: Decodable {
    var id: String { get }
    var name: String { get }
    var referenceImageId: String? { get }
}
