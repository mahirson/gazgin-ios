import SwiftUI

// MARK: - InputFieldType — Visual Style Variant

/// Visual style variants for input fields.

///

/// | Type       | Border behaviour                      |

/// |------------|---------------------------------------|

/// | `.base`    | Subtle border; primary on focus       |

/// | `.bordered`| Always primary-color border           |

/// | `.filled`  | Subtle border (content-present style) |

public enum InputFieldType: Sendable {

    /// Default flat style — subtle border that becomes primary on focus.

    case base

    /// Always shows a prominent primary-color border.

    case bordered

    /// Flat style; visually identical to `.base` — used semantically to indicate filled content.

    case filled

}

// MARK: - InputTextType — Keyboard / Input Behaviour

/// Semantic input text types that configure the software keyboard.

///

/// Use the `.inputKeyboardType(_:)` view modifier to apply.

public enum InputTextType: Sendable {

    /// Default keyboard with no special behaviour.

    case `default`

    /// Email-optimised keyboard (@ and . keys visible).

    case email

    /// Text keyboard with word capitalisation.

    case name

    /// Password keyboard (may show a key to toggle visibility).

    case password

    /// Numeric keyboard for digits only.

    case number

}

// MARK: - InputFieldShape — Pre-built Shapes

/// Pre-built `RoundedRectangle` instances for input fields.

///

/// Dimensions live in `GazginTheme.dimens` so they can be reused across components.

public enum InputFieldShape {

    /// Default rounded rectangle with 8pt corner radius.

    public static let `default` = RoundedRectangle(cornerRadius: 8)

    /// Larger rounded rectangle with 16pt corner radius (used for code fields).

    public static let code = RoundedRectangle(cornerRadius: 16)

}

// MARK: - Keyboard Configuration Helper

extension View {

    /// Applies keyboard type, content type, and autocapitalisation

    /// based on the semantic `InputTextType`.

    @ViewBuilder

    func inputKeyboardType(_ type: InputTextType) -> some View {

        switch type {

        case .default:

            self

        case .email:

            self

                .keyboardType(.emailAddress)

                .textContentType(.emailAddress)

                .textInputAutocapitalization(.never)

                .autocorrectionDisabled()

        case .name:

            self

                .keyboardType(.default)

                .textContentType(.name)

                .textInputAutocapitalization(.words)

        case .password:

            self

                .keyboardType(.default)

                .textContentType(.password)

                .textInputAutocapitalization(.never)

                .autocorrectionDisabled()

        case .number:

            self

                .keyboardType(.numberPad)

        }

    }

}
