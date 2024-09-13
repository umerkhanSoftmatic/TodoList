
import SwiftUI

struct ListRowView: View {

    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
    }
}

#Preview {
    ListRowView(item: ItemModel(title: "Hey", isCompleted: true))
}
