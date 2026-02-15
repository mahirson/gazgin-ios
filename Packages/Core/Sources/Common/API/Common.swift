import Foundation

/// A generic result type for operations.
public enum AppResult<T: Sendable>: Sendable {
    case success(T)
    case failure(AppError)
}

/// Common application errors.
public enum AppError: Error, Sendable {
    case network(Error)
    case database(Error)
    case unknown(String)
}

/// Protocol for application logging.
public protocol Logger: Sendable {
    func debug(_ message: String, file: String, line: Int)
    func info(_ message: String, file: String, line: Int)
    func warning(_ message: String, file: String, line: Int)
    func error(_ message: String, file: String, line: Int)
}

public extension Logger {
    func debug(_ message: String, file: String = #file, line: Int = #line) {
        debug(message, file: file, line: line)
    }
    func info(_ message: String, file: String = #file, line: Int = #line) {
        info(message, file: file, line: line)
    }
    func warning(_ message: String, file: String = #file, line: Int = #line) {
        warning(message, file: file, line: line)
    }
    func error(_ message: String, file: String = #file, line: Int = #line) {
        error(message, file: file, line: line)
    }
}
