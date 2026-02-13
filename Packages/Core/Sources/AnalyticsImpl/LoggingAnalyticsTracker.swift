import Foundation
import AnalyticsAPI
import CommonAPI
import CommonImpl
import Factory

/// Analytics tracker that logs events (placeholder for real analytics SDK).
public final class LoggingAnalyticsTracker: AnalyticsTracker, @unchecked Sendable {
    private let logger: any CommonAPI.Logger

    public init(logger: any CommonAPI.Logger = Container.shared.logger()) {
        self.logger = logger
    }

    public func track(_ event: AnalyticsEvent) {
        let params = event.parameters.map { "\($0.key)=\($0.value)" }.joined(separator: ", ")
        logger.info("[Analytics] \(event.name) {\(params)}")
    }

    public func setUserProperty(_ key: String, value: String) {
        logger.info("[Analytics] UserProperty: \(key) = \(value)")
    }
}

// MARK: - Factory Registration

public extension Container {
    var analyticsTracker: Factory<any AnalyticsTracker> {
        self { LoggingAnalyticsTracker() }.singleton
    }
}
