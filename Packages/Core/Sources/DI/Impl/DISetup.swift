import Factory

// MARK: - DI Container Setup

/// Central place to configure all Factory container registrations.
/// Import this module in the app target to ensure all registrations are available.
public enum DISetup {
    public static func configure() {
        // Registrations happen via Container extensions in each Impl module.
        // This function is a hook for any global DI configuration.
    }
}
