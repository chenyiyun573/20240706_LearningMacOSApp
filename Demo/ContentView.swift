import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            KeyboardEventsView()
                .frame(width: 300, height: 300, alignment: .center)
            MouseEventsView()
                .frame(width: 300, height: 300, alignment: .center)
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
