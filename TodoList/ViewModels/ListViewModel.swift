
import Foundation

// CRUD functions

class ListViewModel: ObservableObject {  // We have made this ObservableObject after crreating this in TodoListApp file at the beginning
    
    // To make class / struct observable means if there is an update in class or struct object, the view having its instance will automatically keep updating everytime.
    
    // We're gonna make this an Environment Object (so that it ca be used by all the views in our app)
    
    //  To do this, we will create it at the beginning of our app (TodoListApp file)
//    var name: String
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {return}
        self.items = savedItems
        // guard is here since these are by default optionals (user maybe dont add any data)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String)
    {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel)
    {
        if let index = items.firstIndex(where: { $0.id == item.id }) {  // $0 represents existing item
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
