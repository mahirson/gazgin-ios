import Foundation
import NetworkAPI

/// Generic API response wrapper.
public struct ApiResponse<T: Decodable & Sendable>: Decodable, Sendable {
    public let data: T?
    public let message: String?
    public let status: Int

    public init(data: T?, message: String?, status: Int) {
        self.data = data
        self.message = message
        self.status = status
    }
}

// MARK: - Placeholder Service Protocol
// Define Retrofit-equivalent service protocols here.
// Example:
//
// public protocol UserService: Sendable {
//     func getUser(id: String) async throws -> ApiResponse<UserEntity>
//     func getUsers() async throws -> ApiResponse<[UserEntity]>
// }
