import Apexy
import Foundation

public enum RootDependencies {
    public static let apiClient = AlamofireClient(
        requestInterceptor: AppRequestInterceptor(),
        configuration: .default.configure {
            $0.headers.add(.contentType("application/json"))
        }
    )
}
