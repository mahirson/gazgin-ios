import SwiftUI

struct MonthCalendarContent: View {
    let displayedYear: Int
    let selectedMonth: DateComponents?
    let onYearChange: (Int) -> Void
    let onMonthSelected: (DateComponents) -> Void

    var body: some View {
        VStack(spacing: 0) {
            YearNavigation(
                year: displayedYear,
                onPrevious: { onYearChange(displayedYear - 1) },
                onNext: { onYearChange(displayedYear + 1) }
            )

            Spacer().frame(height: 16)

            MonthGrid(
                year: displayedYear,
                selectedMonth: selectedMonth,
                onMonthSelected: onMonthSelected
            )
        }
    }
}

private struct YearNavigation: View {
    let year: Int
    let onPrevious: () -> Void
    let onNext: () -> Void

    var body: some View {
        HStack {
            Button(action: onPrevious) {
                GazginTheme.icons.angleLeft.normal
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(GazginColors.gray900)
            }

            Spacer()

            Text("\(year)")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(GazginColors.gray900)

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

private let monthAbbreviations: [String] = {
    let formatter = DateFormatter()
    return formatter.shortMonthSymbols ?? []
}()

private struct MonthGrid: View {
    let year: Int
    let selectedMonth: DateComponents?
    let onMonthSelected: (DateComponents) -> Void

    var body: some View {
        VStack(spacing: 8) {
            ForEach(0..<4, id: \.self) { row in
                HStack(spacing: 8) {
                    ForEach(0..<3, id: \.self) { col in
                        let monthIndex = row * 3 + col
                        let month = monthIndex + 1
                        let isSelected = selectedMonth?.year == year && selectedMonth?.month == month
                        MonthCell(
                            label: monthAbbreviations[monthIndex],
                            isSelected: isSelected,
                            onClick: {
                                onMonthSelected(DateComponents(year: year, month: month))
                            }
                        )
                    }
                }
            }
        }
    }
}

private struct MonthCell: View {
    let label: String
    let isSelected: Bool
    let onClick: () -> Void

    var body: some View {
        Button(action: onClick) {
            Text(label)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(isSelected ? .white : Color(hex: 0x45454A))
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 32)
                        .fill(isSelected ? GazginColors.primaryBase : Color.clear)
                )
        }
        .buttonStyle(.plain)
    }
}
