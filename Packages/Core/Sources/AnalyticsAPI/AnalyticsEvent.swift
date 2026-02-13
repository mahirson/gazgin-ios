import Foundation

/// Represents an analytics event.
public struct AnalyticsEvent: Sendable {
    public let name: String
    public let parameters: [String: String]

    public init(name: String, parameters: [String: String] = [:]) {
        self.name = name
        self.parameters = parameters
    }
}

/// Analytics action types.
public enum AnalyticsAction: String, Sendable {
    case tap
    case swipe
    case view
    case scroll
    case submit
}

/// Protocol for tracking analytics events.
public protocol AnalyticsTracker: Sendable {
    func track(_ event: AnalyticsEvent)
    func setUserProperty(_ key: String, value: String)
}
