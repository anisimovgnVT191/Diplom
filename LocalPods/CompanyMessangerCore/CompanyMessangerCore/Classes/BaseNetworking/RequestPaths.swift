import Foundation

public enum RequestPaths {
    public static let breeds = "/v1/breeds"
    
    public static let breedDetailed = Self.breeds + "/{id}"
    
    public static let imageById = "/v1/images/{id}"
}
