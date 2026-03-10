import SwiftUI

// MARK: - ImageCardView

/// A card that displays a full-bleed background image with a gradient scrim
/// and text overlay showing a title and a subtitle with a location-pin icon.
///
/// Matches the Figma **Card / Property 1=1** component:
/// 327 × 180 pt, 16 pt corner radius, bottom gradient, white text.
///
/// Usage:
/// ```swift
/// ImageCardView(
///     image: Image("place_photo"),
///     title: "Glacier National Park",
///     subtitle: "Bali, Indonesia",
///     action: { print("tapped") }
/// )
/// ```
///
/// For async images loaded from a URL, wrap with `AsyncImage`:
/// ```swift
/// ImageCardView(
///     image: asyncImage,
///     title: place.name,
///     subtitle: place.location,
///     action: { navigate(to: place) }
/// )
/// ```
public struct ImageCardView: View {

    public let image: Image
    public let title: String
    public let subtitle: String
    public let action: () -> Void

    public init(
        image: Image,
        title: String,
        subtitle: String,
        action: @escaping () -> Void
    ) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            ZStack(alignment: .bottomLeading) {
                // Background image
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 180)
                    .clipped()

                // Gradient scrim
                Rectangle()
                    .fill(GazginBrushes.bottomScrim)

                // Text overlay
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(GazginTheme.typeface.h6.semibold)
                        .foregroundColor(.white)

                    HStack(spacing: 6) {
                        GazginTheme.icons.locationPinAlt.filled
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.white)

                        Text(subtitle)
                            .font(GazginTheme.typeface.label.medium)
                            .foregroundColor(.white)
                    }
                }
                .padding(.leading, GazginTheme.dimens.horizontalPadding)
                .padding(.bottom, GazginTheme.dimens.horizontalPadding)
                .padding(.trailing, GazginTheme.dimens.horizontalPadding)
            }
            .frame(height: 180)
            .background(GazginColors.gray50)
            .clipShape(RoundedRectangle(cornerRadius: GazginTheme.dimens.cornerRadiusLarge))
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Previews

struct ImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ImageCardView(
                image: Image(systemName: "photo.fill"),
                title: "Glacier National Park",
                subtitle: "Bali, Indonesia",
                action: {}
            )
        }
        .padding()
        .gazginTheme()
    }
}
