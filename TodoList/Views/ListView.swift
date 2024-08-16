//

import SwiftUI

struct ListView: View {
    
    //Since items are in the model now and we do have our environment model so we dont need the items (array) now
    
    @EnvironmentObject var listViewModel: ListViewModel
    
//    @State var items: [ItemModel] = [
//        ItemModel(title: "This is the first title!", isCompleted: true),
//        ItemModel(title: "This is the second title!", isCompleted: false),
//        ItemModel(title: "This is the third title!", isCompleted: true)
//    ]
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
                else
                {
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    listViewModel.updateItem(item: item)
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                    // .listStyle(PlainListStyle())
                }
            }
        .navigationTitle("Todo List📝")
        .navigationBarItems(leading: EditButton(),
                            trailing:
                                NavigationLink("Add", destination: AddView())
        )
    }
    
}
#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}




