import Foundation

final class RMRequest {
    ///API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    /// Desired Endpoint
    private let endpoint: RMEndpoint
    /// Path components for API ,if any
    private let pathComponents: Set<String>
    /// Query arguments for API, if any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the API request in String format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    public init(
        endpoint: RMEndpoint,
        pathComponents: Set<String> = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
