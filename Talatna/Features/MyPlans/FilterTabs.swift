import SwiftUI

enum FilterType {
    case all, shared, notShared
}

struct FilterTabs: View {
    @Binding var selected: FilterType

    var body: some View {
        HStack {
            tab("All", .all)
            tab("Shared", .shared)
            tab("Not Shared", .notShared)
        }
    }

    private func tab(_ title: String, _ type: FilterType) -> some View {
        Button {
            selected = type
        } label: {
            Text(title)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(selected == type ? Color.orange : Color.white)
                .cornerRadius(20)
        }
    }
}
