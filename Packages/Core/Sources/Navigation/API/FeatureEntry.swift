import SwiftUI

public protocol FeatureEntry {
    @ViewBuilder
    func makeView() -> AnyView
}
