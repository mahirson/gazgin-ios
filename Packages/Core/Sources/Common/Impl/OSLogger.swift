import Foundation
import os
import Factory

/// Logger implementation using os.Logger.
public final class OSLogger: Common.Logger, @unchecked Sendable {
    private let logger: os.Logger

    public init(subsystem: String = Bundle.main.bundleIdentifier ?? "com.gazgin", category: String = "app") {
        self.logger = os.Logger(subsystem: subsystem, category: category)
    }

    public func debug(_ message: String, file: String, line: Int) {
        logger.debug("[\(file):\(line)] \(message)")
    }

    public func info(_ message: String, file: String, line: Int) {
        logger.info("[\(file):\(line)] \(message)")
    }

    public func warning(_ message: String, file: String, line: Int) {
        logger.warning("[\(file):\(line)] \(message)")
    }

    public func error(_ message: String, file: String, line: Int) {
        logger.error("[\(file):\(line)] \(message)")
    }
}

// MARK: - Factory Registration

public extension Container {
    var logger: Factory<any Common.Logger> {
        self { OSLogger() }.singleton
    }
}
