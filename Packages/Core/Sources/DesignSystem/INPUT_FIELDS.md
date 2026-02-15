# Input Fields

Reusable input field views built on top of the Gazgin design system. All fields read colors from `@Environment(\.gazginColors)`, typography from `GazginTheme.typeface`, and dimensions from `GazginTheme.dimens` automatically.

> See [Design System README](README.md) for colors, typography, dimensions, and theme setup.

---

## Available Components

| View | Purpose | Keyboard |
|---|---|---|
| `BaseInputField` | Core building block — all others delegate to it | Configurable via `InputTextType` |
| `LabelField` | Generic single-line text input | Configurable |
| `EmailField` | Email address input | Email keyboard |
| `NameField` | Full name input | Word capitalisation |
| `PasswordField` | Password with visibility toggle support | Password keyboard |
| `TextArea` | Multi-line text input (140pt default height) | Configurable |
| `CodeField` | Single-digit OTP / verification code (56×56pt) | Numeric keyboard |

---

## Enums

### `InputFieldType` — visual style

| Value | Behaviour |
|---|---|
| `.base` | Subtle border; becomes primary on focus |
| `.bordered` | Always shows primary-color border |
| `.filled` | Subtle border (semantic variant for content-present state) |

### `InputTextType` — keyboard behaviour

| Value | Keyboard |
|---|---|
| `.default` | Standard keyboard |
| `.email` | Email-optimised (@ and . visible) |
| `.name` | Text with word capitalisation |
| `.password` | Password keyboard |
| `.number` | Numeric keyboard |

---

## Usage Examples

### Basic Label Field

```swift
@State private var text = ""

LabelField(
    value: $text,
    placeholder: "Enter something"
)
```

### Email Field

```swift
@State private var email = ""

EmailField(value: $email)
```

### Name Field

```swift
@State private var name = ""

NameField(value: $name)
```

### Password Field with Visibility Toggle

```swift
@State private var password = ""
@State private var visible = false

PasswordField(
    value: $password,
    passwordVisible: visible
) {
    Button { visible.toggle() } label: {
        Image(systemName: visible ? "eye" : "eye.slash")
            .frame(width: 20, height: 20)
            .foregroundStyle(colors.gray.gray500)
    }
}
```

### Text Area

```swift
@State private var bio = ""

TextArea(
    value: $bio,
    placeholder: "Tell us about yourself"
)
```

### OTP Code Input (Row of CodeFields)

```swift
@State private var digits = Array(repeating: "", count: 4)

HStack(spacing: 12) {
    ForEach(0..<4, id: \.self) { index in
        CodeField(
            value: $digits[index],
            isError: hasError
        )
    }
}
```

---

## Using `InputFieldType`

Pass a `fieldType` to control the visual style:

```swift
// Default — subtle border, primary on focus
LabelField(
    value: $text,
    fieldType: .base
)

// Always bordered with primary color
LabelField(
    value: $text,
    fieldType: .bordered
)

// Filled style (semantically indicates content is present)
LabelField(
    value: $text,
    fieldType: .filled
)
```

---

## Using `InputTextType` with BaseInputField

`LabelField` and `TextArea` expose `inputTextType` directly. For full control, use `BaseInputField`:

```swift
BaseInputField(
    value: $phone,
    inputTextType: .number,
    placeholder: "Phone number"
)
.frame(height: GazginTheme.dimens.fieldHeight)
```

---

## Adding Icons

`LabelField`, `EmailField`, and `NameField` support `leadingIcon` and `trailingIcon` slots. `PasswordField` supports a `trailingIcon` slot.

### Leading Icon

```swift
EmailField(
    value: $email,
    leadingIcon: {
        Image(systemName: "envelope")
            .frame(width: 20, height: 20)
            .foregroundStyle(colors.gray.gray500)
    },
    trailingIcon: { EmptyView() }
)
```

### Both Icons

```swift
LabelField(
    value: $search,
    placeholder: "Search",
    leadingIcon: {
        Image(systemName: "magnifyingglass")
            .frame(width: 20, height: 20)
            .foregroundStyle(colors.gray.gray500)
    },
    trailingIcon: {
        Button { search = "" } label: {
            Image(systemName: "xmark.circle.fill")
                .frame(width: 20, height: 20)
                .foregroundStyle(colors.gray.gray400)
        }
    }
)
```

---

## Error State

Pass `isError: true` to highlight the field with the error border color:

```swift
EmailField(
    value: $email,
    isError: !email.isEmpty && !email.contains("@")
)
```

---

## Disabled & Read-Only

```swift
// Disabled — prevents all interaction, muted appearance
LabelField(
    value: $text,
    placeholder: "Cannot edit",
    enabled: false
)

// Read-only — visually active but editing is blocked
LabelField(
    value: $text,
    readOnly: true
)
```

---

## Complete Sign-Up Form Example

```swift
struct SignUpForm: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var passwordVisible = false

    @Environment(\.gazginColors) private var colors

    var body: some View {
        VStack(spacing: 16) {
            NameField(value: $name)

            EmailField(
                value: $email,
                isError: !email.isEmpty && !email.contains("@")
            )

            PasswordField(
                value: $password,
                passwordVisible: passwordVisible
            ) {
                Button { passwordVisible.toggle() } label: {
                    Image(systemName: passwordVisible ? "eye" : "eye.slash")
                        .frame(width: 20, height: 20)
                        .foregroundStyle(colors.gray.gray500)
                }
            }
        }
        .padding(.horizontal, 24)
    }
}
```

---

## Shapes

Pre-built shapes are available via `InputFieldShape`:

| Shape | Radius | Used by |
|---|---|---|
| `InputFieldShape.default` | 8pt | All fields except `CodeField` |
| `InputFieldShape.code` | 16pt | `CodeField` |

Override the shape on `BaseInputField` via the `shape` parameter:

```swift
BaseInputField(
    value: $text,
    placeholder: "Search",
    shape: RoundedRectangle(cornerRadius: 24) // pill shape
)
.frame(height: GazginTheme.dimens.fieldHeight)
```

---

## Dimensions

All dimension tokens are accessed via `GazginTheme.dimens`:

| Token | Value | Used by |
|---|---|---|
| `fieldHeight` | 56pt | `LabelField`, `EmailField`, `NameField`, `PasswordField` |
| `textAreaHeight` | 140pt | `TextArea` |
| `codeFieldSize` | 56pt | `CodeField` (width & height) |
| `borderWidth` | 1pt | All fields |
| `horizontalPadding` | 16pt | Inner content padding |
| `verticalPadding` | 16pt | Inner content padding |
| `iconSpacing` | 12pt | Gap between icons and text |
| `iconSize` | 20pt | Recommended icon frame size |
