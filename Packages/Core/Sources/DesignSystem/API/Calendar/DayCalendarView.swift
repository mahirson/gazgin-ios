import SwiftUI

enum DayCellState {
    case `default`
    case disabled
    case today
    case singleSelected
    case rangeStart
    case rangeMid
    case rangeEnd
}

struct DayCalendarContent: View {
    let selectedDate: Date?
    let rangeStart: Date?
    let rangeEnd: Date?
    let onDateSelected: (Date) -> Void
    let displayedMonth: Date
    let onDisplayedMonthChange: (Date) -> Void
    let onMonthLabelClick: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            MonthNavigation(
                yearMonth: displayedMonth,
                onPrevious: {
                    onDisplayedMonthChange(Calendar.current.date(byAdding: .month, value: -1, to: displayedMonth)!)
                },
                onNext: {
                    onDisplayedMonthChange(Calendar.current.date(byAdding: .month, value: 1, to: displayedMonth)!)
                },
                onLabelClick: onMonthLabelClick
            )

            Spacer().frame(height: 12)

            WeekdayRow()

            Spacer().frame(height: 4)

            CalendarGrid(
                yearMonth: displayedMonth,
                selectedDate: selectedDate,
                rangeStart: rangeStart,
                rangeEnd: rangeEnd,
                onDateSelected: onDateSelected
            )
        }
    }
}

private struct MonthNavigation: View {
    let yearMonth: Date
    let onPrevious: () -> Void
    let onNext: () -> Void
    let onLabelClick: () -> Void

    private var monthLabel: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter.string(from: yearMonth)
    }

    var body: some View {
        HStack {
            Button(action: onPrevious) {
                GazginTheme.icons.angleLeft.normal
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(GazginColors.gray900)
            }

            Spacer()

            Button(action: onLabelClick) {
                HStack(spacing: 2) {
                    Text(monthLabel)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(GazginColors.gray900)
                    GazginTheme.icons.angleDown.small
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(GazginColors.gray900)
                }
            }

            Spacer()

            Button(action: onNext) {
                GazginTheme.icons.angleRight.normal
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(GazginColors.gray900)
            }
        }
    }
}

private let weekDaySymbols: [String] = {
    let cal = Calendar.current
    let symbols = cal.shortWeekdaySymbols
    // Rotate so Monday is first
    let mondayIndex = (cal.firstWeekday == 1) ? 1 : 0
    return Array(symbols[mondayIndex...]) + Array(symbols[..<mondayIndex])
}()

private struct WeekdayRow: View {
    var body: some View {
        HStack(spacing: 0) {
            ForEach(weekDaySymbols, id: \.self) { day in
                Text(day.uppercased())
                    .font(.system(size: 10, weight: .medium))
                    .tracking(0.8)
                    .foregroundColor(GazginColors.gray500)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

private struct CalendarGrid: View {
    let yearMonth: Date
    let selectedDate: Date?
    let rangeStart: Date?
    let rangeEnd: Date?
    let onDateSelected: (Date) -> Void

    private var cal: Calendar { Calendar.current }

    private var gridData: [[DayCellInfo]] {
        let year = cal.component(.year, from: yearMonth)
        let month = cal.component(.month, from: yearMonth)

        let firstOfMonth = cal.date(from: DateComponents(year: year, month: month, day: 1))!
        let daysInMonth = cal.range(of: .day, in: .month, for: firstOfMonth)!.count

        // Monday = 2 in Calendar, Sunday = 1
        var weekday = cal.component(.weekday, from: firstOfMonth)
        // Shift to Monday-based: Mon=0, Tue=1, ..., Sun=6
        let leadingOffset = (weekday + 5) % 7

        let prevMonth = cal.date(byAdding: .month, value: -1, to: firstOfMonth)!
        let daysInPrevMonth = cal.range(of: .day, in: .month, for: prevMonth)!.count

        let totalCells = leadingOffset + daysInMonth
        let rows = (totalCells + 6) / 7
        let today = Date()

        var grid: [[DayCellInfo]] = []

        for row in 0..<rows {
            var rowCells: [DayCellInfo] = []
            for col in 0..<7 {
                let index = row * 7 + col
                let dayOfMonth = index - leadingOffset + 1

                if dayOfMonth < 1 {
                    let prevDay = daysInPrevMonth + dayOfMonth
                    let date = cal.date(from: DateComponents(year: year, month: month - 1, day: prevDay))!
                    rowCells.append(DayCellInfo(date: date, day: prevDay, state: .disabled))
                } else if dayOfMonth > daysInMonth {
                    let nextDay = dayOfMonth - daysInMonth
                    let date = cal.date(from: DateComponents(year: year, month: month + 1, day: nextDay))!
                    rowCells.append(DayCellInfo(date: date, day: nextDay, state: .disabled))
                } else {
                    let date = cal.date(from: DateComponents(year: year, month: month, day: dayOfMonth))!
                    let state = resolveDayCellState(
                        date: date, today: today,
                        selectedDate: selectedDate,
                        rangeStart: rangeStart, rangeEnd: rangeEnd
                    )
                    rowCells.append(DayCellInfo(date: date, day: dayOfMonth, state: state))
                }
            }
            grid.append(rowCells)
        }
        return grid
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<gridData.count, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<gridData[row].count, id: \.self) { col in
                        let cell = gridData[row][col]
                        DayCell(info: cell) {
                            onDateSelected(cell.date)
                        }
                    }
                }
            }
        }
    }

    private func resolveDayCellState(
        date: Date, today: Date,
        selectedDate: Date?,
        rangeStart: Date?, rangeEnd: Date?
    ) -> DayCellState {
        let hasRange = rangeStart != nil && rangeEnd != nil
        if hasRange, let rs = rangeStart, let re = rangeEnd {
            if cal.isDate(date, inSameDayAs: rs) && cal.isDate(date, inSameDayAs: re) { return .singleSelected }
            if cal.isDate(date, inSameDayAs: rs) { return .rangeStart }
            if cal.isDate(date, inSameDayAs: re) { return .rangeEnd }
            if date > rs && date < re { return .rangeMid }
        }
        if !hasRange, let sel = selectedDate, cal.isDate(date, inSameDayAs: sel) { return .singleSelected }
        if cal.isDate(date, inSameDayAs: today) { return .today }
        return .default
    }
}

private struct DayCellInfo {
    let date: Date
    let day: Int
    let state: DayCellState
}

private struct DayCell: View {
    let info: DayCellInfo
    let onClick: () -> Void

    private let primaryColor = GazginColors.primaryBase

    private var textColor: Color {
        switch info.state {
        case .default: return Color(hex: 0x45454A)
        case .disabled: return Color(hex: 0xD6D8E1)
        case .today: return Color(hex: 0x161A21)
        case .singleSelected, .rangeStart, .rangeMid, .rangeEnd: return .white
        }
    }

    private var bgColor: Color {
        switch info.state {
        case .singleSelected, .rangeStart, .rangeMid, .rangeEnd: return primaryColor
        default: return .clear
        }
    }

    @ViewBuilder
    private var backgroundShape: some View {
        switch info.state {
        case .singleSelected, .today, .default, .disabled:
            Circle().fill(bgColor)
        case .rangeStart:
            UnevenRoundedRectangle(
                topLeadingRadius: 16, bottomLeadingRadius: 16,
                bottomTrailingRadius: 0, topTrailingRadius: 0
            ).fill(bgColor)
        case .rangeEnd:
            UnevenRoundedRectangle(
                topLeadingRadius: 0, bottomLeadingRadius: 0,
                bottomTrailingRadius: 16, topTrailingRadius: 16
            ).fill(bgColor)
        case .rangeMid:
            Rectangle().fill(bgColor)
        }
    }

    var body: some View {
        Button(action: onClick) {
            Text("\(info.day)")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .padding(.vertical, 1)
                .background(backgroundShape)
                .background(
                    info.state == .today
                        ? Circle().fill(primaryColor.opacity(0.12))
                        : nil
                )
        }
        .disabled(info.state == .disabled)
        .buttonStyle(.plain)
    }
}
