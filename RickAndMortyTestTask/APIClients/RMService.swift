import Foundation

final class RMService {
    
    static let shared = RMService()
    
    private init() {}
    
    public func execute<T:Codable>(
        _ request: RMRequest,
        completion: @escaping (Result<T, Error>) -> Void
    ){
    }
}
