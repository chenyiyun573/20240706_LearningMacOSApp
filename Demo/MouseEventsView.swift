import SwiftUI
import AppKit

struct MouseEventsView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let view = CustomMouseView(frame: .zero)
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
    
    class CustomMouseView: NSView {
        override func mouseDown(with event: NSEvent) {
            print("Mouse down at: \(event.locationInWindow)")
        }
    }
}

