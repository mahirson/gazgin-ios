import Foundation

public struct LoginScreenState: Equatable {
    public var isLoading: Bool
    public var error: String?

    public init(isLoading: Bool = false, error: String? = nil) {
        self.isLoading = isLoading
        self.error = error
    }
}

public enum LoginScreenIntent {
    case onAppleLoginClick
    case onGoogleLoginClick
    case onFacebookLoginClick
    case onContinueWithoutSignInClick
}
