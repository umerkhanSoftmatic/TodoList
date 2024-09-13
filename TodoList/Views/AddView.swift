
import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @FocusState var endEdit : Bool
    @State var alertTitle: String = ""
    @State var showAlert:Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Group{
                    TextField("Type something here...", text: $textFieldText)
                        .padding(.horizontal)
                        .focused($endEdit)
                        .frame(height: 55)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(15)
                    //  .padding(.horizontal,15)
                    
                    
                    Button(action: {savebuttonPressed()}, label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(Color.accentColor)
                            .cornerRadius(15)
                            .disabled(textFieldText.count < 3)
                        // .padding(.horizontal,15)
                    })
                } .padding(.horizontal,15)
            }
           Spacer()
            .padding(16)
        }
        .onTapGesture {
            endEdit = false
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func savebuttonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new Todo Item must be at least 3 characters long 😨"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    }
    

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
