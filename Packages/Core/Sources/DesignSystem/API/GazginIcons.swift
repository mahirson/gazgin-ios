import SwiftUI

// MARK: - Variant Types

/// A pair of **normal** (outline/linear) and **filled** (solid) icon variants.
public struct IconStyleVariant: Sendable {
    public let normal: Image
    public let filled: Image

    public init(normal: Image, filled: Image) {
        self.normal = normal
        self.filled = filled
    }
}

/// A pair of **normal** (24 pt) and **small** (compact) icon variants.
public struct IconSizeVariant: Sendable {
    public let normal: Image
    public let small: Image

    public init(normal: Image, small: Image) {
        self.normal = normal
        self.small = small
    }
}

// MARK: - GazginIcons

/// Reusable icons for the design system.
/// Access via `GazginTheme.icons` from any SwiftUI view.
///
/// Usage examples:
/// ```swift
/// GazginTheme.icons.eye.normal
/// GazginTheme.icons.eye.filled
/// GazginTheme.icons.angleDown.normal
/// GazginTheme.icons.angleDown.small
/// GazginTheme.icons.check
/// ```
public struct GazginIcons: Sendable {

    // MARK: - Standalone

    public let search: Image
    public let close: Image
    public let check: Image
    public let times: Image
    public let info: Image
    public let question: Image
    public let setting: Image
    public let arrowBack: Image
    public let arrowDownAlt: Image
    public let arrowUpAlt: Image
    public let calendar: Image
    public let calendar1: Image
    public let calendarAlt: Image
    public let calendarAlt1: Image
    public let calendarDay: Image
    public let calendarDay1: Image
    public let calendarEdit: Image
    public let calendarLines: Image
    public let calendarLines1: Image
    public let calender: Image
    public let checkCircle: Image
    public let checkSquare: Image
    public let clock: Image
    public let coins: Image
    public let component: Image
    public let document: Image
    public let documentText: Image
    public let dollar: Image
    public let edit: Image
    public let faq: Image
    public let fingerPrint: Image
    public let fingerprint: Image
    public let hide: Image
    public let like: Image
    public let location: Image
    public let lock: Image
    public let logout: Image
    public let messageText: Image
    public let minus: Image
    public let minusCircle: Image
    public let minusSquare: Image
    public let moon: Image
    public let notification: Image
    public let planeTilt: Image
    public let plus: Image
    public let plusCircle: Image
    public let plusSquare: Image
    public let profile1: Image
    public let profile2: Image
    public let promo: Image
    public let receiptText: Image
    public let scan: Image
    public let searchAlt: Image
    public let searchNormal: Image
    public let searchNormal1: Image
    public let secure: Image
    public let settingAlt: Image
    public let setting4: Image
    public let settingCoco: Image
    public let settingCocoFilled: Image
    public let share: Image
    public let shop: Image
    public let show: Image
    public let star: Image
    public let sun: Image
    public let support: Image
    public let ticket: Image
    public let ticketDiscount: Image
    public let timesCircle: Image
    public let timesSquare: Image
    public let wallet: Image
    public let warning: Image
    public let world: Image

    // MARK: - Style Variants (normal / filled)

    public let call: IconStyleVariant
    public let discovery: IconStyleVariant
    public let eye: IconStyleVariant
    public let eyeAlt: IconStyleVariant
    public let globeAlt: IconStyleVariant
    public let heart: IconStyleVariant
    public let heartAlt: IconStyleVariant
    public let locationArrow: IconStyleVariant
    public let locationCrosshairs: IconStyleVariant
    public let locationCrosshairsSlash: IconStyleVariant
    public let locationExclamation: IconStyleVariant
    public let locationPin: IconStyleVariant
    public let locationPinAlt: IconStyleVariant
    public let mapPinAlt: IconStyleVariant
    public let profileHicon: IconStyleVariant

    // MARK: - Size Variants (normal / small)

    public let angleDown: IconSizeVariant
    public let angleLeft: IconSizeVariant
    public let angleRight: IconSizeVariant
    public let angleUp: IconSizeVariant
    public let arrowDown: IconSizeVariant
    public let arrowDownLeft: IconSizeVariant
    public let arrowDownRight: IconSizeVariant
    public let arrowLeft: IconSizeVariant
    public let arrowRight: IconSizeVariant
    public let arrowUp: IconSizeVariant
    public let arrowUpLeft: IconSizeVariant
    public let arrowUpRight: IconSizeVariant
}

// MARK: - Default Factory

// swiftlint:disable function_body_length
public func gazginIcons() -> GazginIcons {
    GazginIcons(
        // standalone
        search: Image(systemName: "magnifyingglass"),
        close: Image(systemName: "xmark"),
        check: Image("ic_check", bundle: .module),
        times: Image("ic_times", bundle: .module),
        info: Image("ic_info", bundle: .module),
        question: Image("ic_question", bundle: .module),
        setting: Image("ic_setting", bundle: .module),
        arrowBack: Image("ic_arrow_back", bundle: .module),
        arrowDownAlt: Image("ic_arrow_down", bundle: .module),
        arrowUpAlt: Image("ic_arrow_up", bundle: .module),
        calendar: Image("ic_calendar", bundle: .module),
        calendar1: Image("ic_calendar_1", bundle: .module),
        calendarAlt: Image("ic_calendar_alt", bundle: .module),
        calendarAlt1: Image("ic_calendar_alt_1", bundle: .module),
        calendarDay: Image("ic_calendar_day", bundle: .module),
        calendarDay1: Image("ic_calendar_day_1", bundle: .module),
        calendarEdit: Image("ic_calendar_edit", bundle: .module),
        calendarLines: Image("ic_calendar_lines", bundle: .module),
        calendarLines1: Image("ic_calendar_lines_1", bundle: .module),
        calender: Image("ic_calender", bundle: .module),
        checkCircle: Image("ic_check_circle", bundle: .module),
        checkSquare: Image("ic_check_square", bundle: .module),
        clock: Image("ic_clock", bundle: .module),
        coins: Image("ic_coins", bundle: .module),
        component: Image("ic_component", bundle: .module),
        document: Image("ic_document", bundle: .module),
        documentText: Image("ic_document_text", bundle: .module),
        dollar: Image("ic_dollar", bundle: .module),
        edit: Image("ic_edit", bundle: .module),
        faq: Image("ic_faq", bundle: .module),
        fingerPrint: Image("ic_finger_print", bundle: .module),
        fingerprint: Image("ic_fingerprint", bundle: .module),
        hide: Image("ic_hide", bundle: .module),
        like: Image("ic_like", bundle: .module),
        location: Image("ic_location", bundle: .module),
        lock: Image("ic_lock", bundle: .module),
        logout: Image("ic_logout", bundle: .module),
        messageText: Image("ic_message_text", bundle: .module),
        minus: Image("ic_minus", bundle: .module),
        minusCircle: Image("ic_minus_circle", bundle: .module),
        minusSquare: Image("ic_minus_square", bundle: .module),
        moon: Image("ic_moon", bundle: .module),
        notification: Image("ic_notification", bundle: .module),
        planeTilt: Image("ic_plane_tilt", bundle: .module),
        plus: Image("ic_plus", bundle: .module),
        plusCircle: Image("ic_plus_circle", bundle: .module),
        plusSquare: Image("ic_plus_square", bundle: .module),
        profile1: Image("ic_profile_1", bundle: .module),
        profile2: Image("ic_profile_2", bundle: .module),
        promo: Image("ic_promo", bundle: .module),
        receiptText: Image("ic_receipt_text", bundle: .module),
        scan: Image("ic_scan", bundle: .module),
        searchAlt: Image("ic_search", bundle: .module),
        searchNormal: Image("ic_search_normal", bundle: .module),
        searchNormal1: Image("ic_search_normal_1", bundle: .module),
        secure: Image("ic_secure", bundle: .module),
        settingAlt: Image("ic_setting_alt", bundle: .module),
        setting4: Image("ic_setting_4", bundle: .module),
        settingCoco: Image("ic_setting_coco", bundle: .module),
        settingCocoFilled: Image("ic_setting_coco_filled", bundle: .module),
        share: Image("ic_share", bundle: .module),
        shop: Image("ic_shop", bundle: .module),
        show: Image("ic_show", bundle: .module),
        star: Image("ic_star", bundle: .module),
        sun: Image("ic_sun", bundle: .module),
        support: Image("ic_support", bundle: .module),
        ticket: Image("ic_ticket", bundle: .module),
        ticketDiscount: Image("ic_ticket_discount", bundle: .module),
        timesCircle: Image("ic_times_circle", bundle: .module),
        timesSquare: Image("ic_times_square", bundle: .module),
        wallet: Image("ic_wallet", bundle: .module),
        warning: Image("ic_warning", bundle: .module),
        world: Image("ic_world", bundle: .module),

        // style variants
        call: IconStyleVariant(
            normal: Image("ic_call", bundle: .module),
            filled: Image("ic_call_filled", bundle: .module)
        ),
        discovery: IconStyleVariant(
            normal: Image("ic_discovery", bundle: .module),
            filled: Image("ic_discovery_filled", bundle: .module)
        ),
        eye: IconStyleVariant(
            normal: Image("ic_eye", bundle: .module),
            filled: Image("ic_eye_filled", bundle: .module)
        ),
        eyeAlt: IconStyleVariant(
            normal: Image("ic_eye_alt", bundle: .module),
            filled: Image("ic_eye_alt_filled", bundle: .module)
        ),
        globeAlt: IconStyleVariant(
            normal: Image("ic_globe_alt", bundle: .module),
            filled: Image("ic_globe_alt_filled", bundle: .module)
        ),
        heart: IconStyleVariant(
            normal: Image("ic_heart", bundle: .module),
            filled: Image("ic_heart_filled", bundle: .module)
        ),
        heartAlt: IconStyleVariant(
            normal: Image("ic_heart_alt", bundle: .module),
            filled: Image("ic_heart_alt_filled", bundle: .module)
        ),
        locationArrow: IconStyleVariant(
            normal: Image("ic_location_arrow", bundle: .module),
            filled: Image("ic_location_arrow_filled", bundle: .module)
        ),
        locationCrosshairs: IconStyleVariant(
            normal: Image("ic_location_crosshairs", bundle: .module),
            filled: Image("ic_location_crosshairs_filled", bundle: .module)
        ),
        locationCrosshairsSlash: IconStyleVariant(
            normal: Image("ic_location_crosshairs_slash", bundle: .module),
            filled: Image("ic_location_crosshairs_slash_filled", bundle: .module)
        ),
        locationExclamation: IconStyleVariant(
            normal: Image("ic_location_exclamation", bundle: .module),
            filled: Image("ic_location_exclamation_filled", bundle: .module)
        ),
        locationPin: IconStyleVariant(
            normal: Image("ic_location_pin", bundle: .module),
            filled: Image("ic_location_pin_filled", bundle: .module)
        ),
        locationPinAlt: IconStyleVariant(
            normal: Image("ic_location_pin_alt", bundle: .module),
            filled: Image("ic_location_pin_alt_filled", bundle: .module)
        ),
        mapPinAlt: IconStyleVariant(
            normal: Image("ic_map_pin_alt", bundle: .module),
            filled: Image("ic_map_pin_alt_filled", bundle: .module)
        ),
        profileHicon: IconStyleVariant(
            normal: Image("ic_profile_hicon", bundle: .module),
            filled: Image("ic_profile_hicon_filled", bundle: .module)
        ),

        // size variants
        angleDown: IconSizeVariant(
            normal: Image("ic_angle_down", bundle: .module),
            small: Image("ic_angle_down_small", bundle: .module)
        ),
        angleLeft: IconSizeVariant(
            normal: Image("ic_angle_left", bundle: .module),
            small: Image("ic_angle_left_small", bundle: .module)
        ),
        angleRight: IconSizeVariant(
            normal: Image("ic_angle_right", bundle: .module),
            small: Image("ic_angle_right_small", bundle: .module)
        ),
        angleUp: IconSizeVariant(
            normal: Image("ic_angle_up", bundle: .module),
            small: Image("ic_angle_up_small", bundle: .module)
        ),
        arrowDown: IconSizeVariant(
            normal: Image("ic_arrow_down", bundle: .module),
            small: Image("ic_arrow_down_small", bundle: .module)
        ),
        arrowDownLeft: IconSizeVariant(
            normal: Image("ic_arrow_down_left", bundle: .module),
            small: Image("ic_arrow_down_left_small", bundle: .module)
        ),
        arrowDownRight: IconSizeVariant(
            normal: Image("ic_arrow_down_right", bundle: .module),
            small: Image("ic_arrow_down_right_small", bundle: .module)
        ),
        arrowLeft: IconSizeVariant(
            normal: Image("ic_arrow_left", bundle: .module),
            small: Image("ic_arrow_left_small", bundle: .module)
        ),
        arrowRight: IconSizeVariant(
            normal: Image("ic_arrow_right", bundle: .module),
            small: Image("ic_arrow_right_small", bundle: .module)
        ),
        arrowUp: IconSizeVariant(
            normal: Image("ic_arrow_up", bundle: .module),
            small: Image("ic_arrow_up_small", bundle: .module)
        ),
        arrowUpLeft: IconSizeVariant(
            normal: Image("ic_arrow_up_left", bundle: .module),
            small: Image("ic_arrow_up_left_small", bundle: .module)
        ),
        arrowUpRight: IconSizeVariant(
            normal: Image("ic_arrow_up_right", bundle: .module),
            small: Image("ic_arrow_up_right_small", bundle: .module)
        )
    )
}
// swiftlint:enable function_body_length
