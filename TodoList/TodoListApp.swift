
import SwiftUI

@main
struct TodoListApp: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    //When this (ListViewModel) object changes, our views will actually update. So, to do this we need to add a property wrapper (@StateObject) to this.
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {   //by doing this all the views in our app will automatically be in navigation view
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle()) // to make app adjustable for all devices (iPad , iPhone etc)
            .environmentObject(listViewModel) //now all the views within navigation view will have access to this model
        }
    }
}
