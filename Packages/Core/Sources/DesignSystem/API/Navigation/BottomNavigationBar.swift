import SwiftUI

public enum BottomNavTab: Int, CaseIterable {
    case home = 0
    case explore = 1
    case wishlist = 2
    case account = 3
}

/// A bottom navigation bar matching the Figma **Travel App UI Kit → Menu** design.
/// Contains 4 fixed tabs: Home, Explore, Wishlist, Account.
///
/// - Parameters:
///   - selectedTab: The currently selected tab.
public struct BottomNavigationBar: View {
    @Binding public var selectedTab: BottomNavTab

    public init(selectedTab: Binding<BottomNavTab>) {
        self._selectedTab = selectedTab
    }

    public var body: some View {
        HStack {
            ForEach(BottomNavTab.allCases, id: \.rawValue) { tab in
                let isSelected = tab == selectedTab
                let content = resolveTabContent(tab)
                let displayIcon = isSelected ? content.activeIcon : content.icon

                BottomNavItemView(
                    icon: displayIcon,
                    label: content.label,
                    isSelected: isSelected
                ) {
                    selectedTab = tab
                }
                .frame(maxWidth: .infinity)
            }
        }
        .frame(height: 64)
        .padding(.horizontal, 20)
        .padding(.top, 4)
        .background(Color.white)
    }

    private func resolveTabContent(_ tab: BottomNavTab) -> TabContent {
        let icons = GazginTheme.icons
        switch tab {
        case .home:
            return TabContent(icon: icons.home.normal, activeIcon: icons.home.filled, label: "Home")
        case .explore:
            return TabContent(icon: icons.discovery.normal, activeIcon: icons.discovery.filled, label: "Explore")
        case .wishlist:
            return TabContent(icon: icons.heartAlt.normal, activeIcon: icons.heartAlt.filled, label: "Wishlist")
        case .account:
            return TabContent(icon: icons.profileHicon.normal, activeIcon: icons.profileHicon.filled, label: "Account")
        }
    }
}

private struct TabContent {
    let icon: Image
    let activeIcon: Image
    let label: String
}

private struct BottomNavItemView: View {
    let icon: Image
    let label: String
    let isSelected: Bool
    let onClick: () -> Void

    private var tint: Color {
        isSelected ? GazginColors.primaryBase : GazginColors.gray400
    }

    var body: some View {
        Button(action: onClick) {
            VStack(spacing: 4) {
                icon
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(tint)
                Text(label)
                    .font(.system(size: 10, weight: isSelected ? .bold : .medium))
                    .tracking(0.5)
                    .foregroundColor(tint)
                    .lineLimit(1)
            }
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Previews

struct BottomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationBarPreviewWrapper()
            .gazginTheme()
    }
}

private struct BottomNavigationBarPreviewWrapper: View {
    @State private var selected: BottomNavTab = .explore

    var body: some View {
        VStack {
            Spacer()
            BottomNavigationBar(selectedTab: $selected)
        }
    }
}
