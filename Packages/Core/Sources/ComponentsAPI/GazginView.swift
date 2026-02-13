import Foundation

/// Base protocol for views that follow the Gazgin component pattern.
public protocol GazginView {
    associatedtype ViewModel
    var viewModel: ViewModel { get }
}
