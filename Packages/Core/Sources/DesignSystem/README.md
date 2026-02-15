# Gazgin iOS Design System

The design system provides unified **colors** and **typography** for the Gazgin iOS app, with automatic dark/light mode support.

## Module

Add `DesignSystem` to your target's dependencies:
```swift
.target(name: "MyFeature", dependencies: ["DesignSystem"])
```

---

## Colors

### Via `GazginTheme.colors(for:)` (recommended)

```swift
@Environment(\.colorScheme) var colorScheme

var body: some View {
    let colors = GazginTheme.colors(for: colorScheme)
    Text("Hello")
        .foregroundColor(colors.primary.base)
        .background(colors.background)
}
```

### Via `@Environment(\.gazginColors)` (inside `.gazginTheme()`)

```swift
@Environment(\.gazginColors) var colors

var body: some View {
    Text("Hello")
        .foregroundColor(colors.primary.base)        // Teal #187A85
        .background(colors.alert.error.base)          // Red #FF4C6D
}
```

### Color Groups

| Group | Fields | Light Example |
|---|---|---|
| `primary` | `base`, `shade50`–`shade400` | `#187A85` (base) |
| `secondary` | `base`, `shade50`–`shade400` | `#FF9141` (base) |
| `alert.success` | `base`, `dark`, `light` | `#0CAF60` (base) |
| `alert.warning` | `base`, `dark`, `light` | `#FFD023` (base) |
| `alert.error` | `base`, `dark`, `light` | `#FF4C6D` (base) |
| `gray` | `gray50`–`gray900` | `#FCFCFD`→`#111827` |
| Semantic | `background`, `surface`, `onPrimary`, etc. | Adapts to mode |

---

## Typography

### Via `GazginTheme.typeface`

```swift
Text("Welcome to Gazgin")
    .font(GazginTheme.typeface.display.semibold)

Text("Section Title")
    .font(GazginTheme.typeface.h3.medium)

Text("Body text")
    .font(GazginTheme.typeface.body.regular)
```

### Type Scale Reference

| Scale | Size | Weights |
|---|---|---|
| `display` | 36pt | `regular`, `medium`, `semibold`, `bold` |
| `h1` | 32pt | `regular`, `medium`, `semibold`, `bold` |
| `h2` | 28pt | `regular`, `medium`, `semibold`, `bold` |
| `h3` | 24pt | `regular`, `medium`, `semibold`, `bold` |
| `h4` | 22pt | `regular`, `medium`, `semibold`, `bold` |
| `h5` | 20pt | `regular`, `medium`, `semibold`, `bold` |
| `h6` | 18pt | `regular`, `medium`, `semibold`, `bold` |
| `label` | 12pt | `regular`, `medium`, `semibold`, `bold` |
| `body` | 16pt | `regular`, `medium`, `semibold`, `bold` |

---

## Theme Setup

Apply `.gazginTheme()` at your root view:

```swift
ContentView()
    .gazginTheme()
```

This sets up:
- Automatic dark/light color switching
- Default body font
- `@Environment(\.gazginColors)` for child views
