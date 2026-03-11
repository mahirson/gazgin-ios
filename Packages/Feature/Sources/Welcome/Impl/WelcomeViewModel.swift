import Foundation
import SwiftUI

public struct WelcomeScreenState: Equatable {
    public var currentPage: Int

    public init(currentPage: Int = 0) {
        self.currentPage = currentPage
    }
}

public enum WelcomeScreenIntent {
    case onNextPage
    case onPreviousPage
    case onPageChanged(Int)
    case onSkip
}

@Observable
public final class WelcomeViewModel: @unchecked Sendable {
    public var state: WelcomeScreenState

    public init(initialState: WelcomeScreenState = WelcomeScreenState()) {
        self.state = initialState
    }

    public func onIntent(_ intent: WelcomeScreenIntent) {
        switch intent {
        case .onNextPage:
            state.currentPage += 1
        case .onPreviousPage:
            state.currentPage -= 1
        case let .onPageChanged(page):
            state.currentPage = page
        case .onSkip:
            // Handle skip action, such as navigating away
            break
        }
    }
}
