import SwiftUI

public enum CalendarType {
    case day
    case month
}

/// A calendar date-picker component matching the Figma **Travel App UI Kit**.
/// Supports both day-level and month-level views, switchable via the month label.
///
/// - Parameters:
///   - calendarType: Initial view to display (`.day` or `.month`).
///   - selectedDate: The currently selected single date.
///   - rangeStart: Start of the selected date range, or `nil`.
///   - rangeEnd: End of the selected date range, or `nil`.
///   - onDateSelected: Called when the user taps a day cell.
///   - onConfirm: Called when the user taps the bottom "Select Date" button.
///   - confirmButtonText: Label for the bottom action button.
public struct CalendarView: View {
    @State private var currentType: CalendarType
    @State private var displayedMonth: Date

    private let selectedDate: Date?
    private let rangeStart: Date?
    private let rangeEnd: Date?
    private let onDateSelected: (Date) -> Void
    private let onConfirm: () -> Void
    private let confirmButtonText: String

    public init(
        calendarType: CalendarType = .day,
        selectedDate: Date? = nil,
        rangeStart: Date? = nil,
        rangeEnd: Date? = nil,
        onDateSelected: @escaping (Date) -> Void,
        onConfirm: @escaping () -> Void,
        confirmButtonText: String = "Select Date"
    ) {
        self._currentType = State(initialValue: calendarType)
        self._displayedMonth = State(initialValue: selectedDate ?? rangeStart ?? Date())
        self.selectedDate = selectedDate
        self.rangeStart = rangeStart
        self.rangeEnd = rangeEnd
        self.onDateSelected = onDateSelected
        self.onConfirm = onConfirm
        self.confirmButtonText = confirmButtonText
    }

    public var body: some View {
        VStack(spacing: 0) {
            // Drag handle
            Spacer().frame(height: 16)
            RoundedRectangle(cornerRadius: 1.5)
                .fill(GazginColors.gray200)
                .frame(width: 60, height: 3)

            Spacer().frame(height: 24)

            // Header
            CalendarHeader(
                currentType: currentType,
                selectedDate: selectedDate,
                rangeStart: rangeStart,
                rangeEnd: rangeEnd,
                displayedMonth: displayedMonth
            )
            .padding(.horizontal, 24)

            Spacer().frame(height: 24)

            // Calendar body
            Group {
                switch currentType {
                case .day:
                    DayCalendarContent(
                        selectedDate: selectedDate,
                        rangeStart: rangeStart,
                        rangeEnd: rangeEnd,
                        onDateSelected: onDateSelected,
                        displayedMonth: displayedMonth,
                        onDisplayedMonthChange: { displayedMonth = $0 },
                        onMonthLabelClick: { currentType = .month }
                    )
                case .month:
                    let year = Calendar.current.component(.year, from: displayedMonth)
                    let month = Calendar.current.component(.month, from: displayedMonth)
                    MonthCalendarContent(
                        displayedYear: year,
                        selectedMonth: DateComponents(year: year, month: month),
                        onYearChange: { newYear in
                            let currentMonth = Calendar.current.component(.month, from: displayedMonth)
                            displayedMonth = Calendar.current.date(
                                from: DateComponents(year: newYear, month: currentMonth, day: 1)
                            )!
                        },
                        onMonthSelected: { components in
                            displayedMonth = Calendar.current.date(from: components)!
                            currentType = .day
                        }
                    )
                }
            }
            .padding(.horizontal, 24)

            Spacer().frame(height: 16)

            // Bottom action bar
            BottomActionBar(text: confirmButtonText, onClick: onConfirm)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: 40, bottomLeadingRadius: 0,
                bottomTrailingRadius: 0, topTrailingRadius: 40
            )
        )
    }
}

private struct CalendarHeader: View {
    let currentType: CalendarType
    let selectedDate: Date?
    let rangeStart: Date?
    let rangeEnd: Date?
    let displayedMonth: Date

    private var title: String {
        currentType == .day ? "Select Date" : "Select Month"
    }

    private var subtitle: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"

        switch currentType {
        case .day:
            if let rs = rangeStart, let re = rangeEnd {
                return "\(dateFormatter.string(from: rs)) – \(dateFormatter.string(from: re))"
            } else if let sel = selectedDate {
                return dateFormatter.string(from: sel)
            }
            return "No date selected"
        case .month:
            let monthFormatter = DateFormatter()
            monthFormatter.dateFormat = "MMMM, yyyy"
            return monthFormatter.string(from: displayedMonth)
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(GazginTheme.typeface.h5.semibold)
                .foregroundColor(GazginColors.gray900)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(subtitle)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(GazginColors.gray500)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

private struct BottomActionBar: View {
    let text: String
    let onClick: () -> Void

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack {
            GazginButton(
                text: text,
                style: GazginTheme.styles(for: colorScheme).button.primary,
                action: onClick
            )
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .padding(.bottom, 16)
        .background(Color.white)
    }
}

// MARK: - Previews

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CalendarView(
                calendarType: .day,
                selectedDate: makeDateComponents(year: 2022, month: 6, day: 20),
                onDateSelected: { _ in },
                onConfirm: {}
            )
        }
        .background(Color(hex: 0xF5F5F5))
        .gazginTheme()
        .previewDisplayName("Day View")

        VStack {
            CalendarView(
                calendarType: .month,
                selectedDate: makeDateComponents(year: 2022, month: 9, day: 15),
                onDateSelected: { _ in },
                onConfirm: {}
            )
        }
        .background(Color(hex: 0xF5F5F5))
        .gazginTheme()
        .previewDisplayName("Month View")

        VStack {
            CalendarView(
                rangeStart: makeDateComponents(year: 2022, month: 6, day: 20),
                rangeEnd: makeDateComponents(year: 2022, month: 6, day: 22),
                onDateSelected: { _ in },
                onConfirm: {}
            )
        }
        .background(Color(hex: 0xF5F5F5))
        .gazginTheme()
        .previewDisplayName("Date Range")
    }

    private static func makeDateComponents(year: Int, month: Int, day: Int) -> Date {
        Calendar.current.date(from: DateComponents(year: year, month: month, day: day))!
    }
}
