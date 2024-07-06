import Cocoa

public class GlobalEventMonitor: ObservableObject {
    private var mouseEventMonitor: Any?
    private var keyEventMonitor: Any?
    
    deinit {
        stopMonitoring()
    }
    
    public func startMonitoring() {
        // Monitoring mouse events
        mouseEventMonitor = NSEvent.addGlobalMonitorForEvents(matching: [.leftMouseDown, .rightMouseDown]) { event in
            print("Mouse Event: \(event.type) at \(event.locationInWindow)")
        }

        // Monitoring key events
        keyEventMonitor = NSEvent.addGlobalMonitorForEvents(matching: [.keyDown]) { event in
            print("Key Event: \(event.charactersIgnoringModifiers ?? "")")
        }
    }
    
    public func stopMonitoring() {
        if let mouseMonitor = mouseEventMonitor {
            NSEvent.removeMonitor(mouseMonitor)
            mouseEventMonitor = nil
        }
        if let keyMonitor = keyEventMonitor {
            NSEvent.removeMonitor(keyMonitor)
            keyEventMonitor = nil
        }
    }
}
