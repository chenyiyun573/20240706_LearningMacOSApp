import SwiftUI
import AppKit

struct KeyboardEventsView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let view = CustomKeyboardView(frame: .zero)
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
    
    class CustomKeyboardView: NSView {
        override var acceptsFirstResponder: Bool { true }

        override func keyDown(with event: NSEvent) {
            print("Key pressed: \(event.charactersIgnoringModifiers ?? "")")
        }
    }
}
