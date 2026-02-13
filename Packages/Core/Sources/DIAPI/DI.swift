import Factory

/// Re-export Factory for consumers.
public enum DIScope {
    case singleton
    case cached
    case shared
    case unique
}
