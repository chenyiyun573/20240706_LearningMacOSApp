import SwiftUI
import AppKit


struct ContentView: View {
    var body: some View {
        Button("Take Screenshot") {
            takeScreenshot()
        }
        .buttonStyle(.bordered)
        .padding()
        .frame(width: 200, height: 50, alignment: .center)
    }
    
    private func takeScreenshot() {
        let screenRect = NSScreen.main?.frame ?? CGRect.zero
        guard let imageRef = CGWindowListCreateImage(screenRect, .optionIncludingWindow, kCGNullWindowID, .nominalResolution) else {
            print("Failed to capture screenshot")
            return
        }
        let bitmapRep = NSBitmapImageRep(cgImage: imageRef)
        guard let pngData = bitmapRep.representation(using: .png, properties: [:]) else {
            print("Failed to create PNG data")
            return
        }
        saveScreenshot(data: pngData)
    }
    
    private func saveScreenshot(data: Data) {
        let desktopURL = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first!
        let fileURL = desktopURL.appendingPathComponent("screenshot.png")
        
        do {
            try data.write(to: fileURL)
            print("Screenshot saved to \(fileURL.path)")
        } catch {
            print("Failed to save screenshot: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
