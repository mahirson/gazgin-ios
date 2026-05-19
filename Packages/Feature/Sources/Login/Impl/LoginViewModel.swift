import Foundation
import SwiftUI

@Observable
public final class LoginViewModel: @unchecked Sendable {
    public var state: LoginScreenState

    public init(initialState: LoginScreenState = LoginScreenState()) {
        self.state = initialState
    }

    public func onIntent(_ intent: LoginScreenIntent) {
        switch intent {
        case .onAppleLoginClick:
            // Handle Apple login
            break
        case .onGoogleLoginClick:
            // Handle Google login
            break
        case .onFacebookLoginClick:
            // Handle Facebook login
            break
        case .onContinueWithoutSignInClick:
            // Handle Continue without signing in
            break
        }
    }
}
