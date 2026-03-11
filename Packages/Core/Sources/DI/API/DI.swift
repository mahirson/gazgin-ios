import Factory
import Navigation

extension Container {
    public var homeNavigation: Factory<FeatureEntry?> {
        self { nil }
    }

    public var profileNavigation: Factory<FeatureEntry?> {
        self { nil }
    }

    public var welcomeNavigation: Factory<FeatureEntry?> {
        self { nil }
    }
}

/// Re-export Factory for consumers.
public enum DIScope {
    case singleton
    case cached
    case shared
    case unique
}
