public struct Breed: BreedBase {
    public let id: String
    public let name: String
    public let referenceImageId: String?
    
    public init(id: String, name: String, referenceImageId: String?) {
        self.id = id
        self.name = name
        self.referenceImageId = referenceImageId
    }
}
