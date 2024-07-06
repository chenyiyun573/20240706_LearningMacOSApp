import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Button("Click Me"){
                print("Button was clicked!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
