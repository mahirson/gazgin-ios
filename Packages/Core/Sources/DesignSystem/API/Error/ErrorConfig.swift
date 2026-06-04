import SwiftUI

public struct ErrorConfig: Sendable {
    public let errorCode: String?
    public let title: String
    public let message: String
    public let actionLabel: String
    public let onAction: @Sendable () -> Void

    public init(
        errorCode: String?,
        title: String,
        message: String,
        actionLabel: String,
        onAction: @Sendable @escaping () -> Void
    ) {
        self.errorCode = errorCode
        self.title = title
        self.message = message
        self.actionLabel = actionLabel
        self.onAction = onAction
    }

    public static func notFound(onAction: @Sendable @escaping () -> Void) -> ErrorConfig {
        ErrorConfig(
            errorCode: "404",
            title: "Error 404",
            message: "We are not online this time. Please try again later",
            actionLabel: "Back to Home",
            onAction: onAction
        )
    }

    public static func serverError(onAction: @Sendable @escaping () -> Void) -> ErrorConfig {
        ErrorConfig(
            errorCode: "500",
            title: "Server Error",
            message: "Something went wrong on our end. Please try again later",
            actionLabel: "Try Again",
            onAction: onAction
        )
    }

    public static func networkError(onAction: @Sendable @escaping () -> Void) -> ErrorConfig {
        ErrorConfig(
            errorCode: nil,
            title: "No Connection",
            message: "Please check your internet connection and try again",
            actionLabel: "Retry",
            onAction: onAction
        )
    }

    public static func generic(
        errorCode: String? = nil,
        title: String,
        message: String,
        actionLabel: String = "Go Back",
        onAction: @Sendable @escaping () -> Void
    ) -> ErrorConfig {
        ErrorConfig(
            errorCode: errorCode,
            title: title,
            message: message,
            actionLabel: actionLabel,
            onAction: onAction
        )
    }
}
