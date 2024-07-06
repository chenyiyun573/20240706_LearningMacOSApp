import SwiftUI
import ScreenCaptureKit
import AVFoundation

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: takeScreenshot) {
                Text("Take Screenshot")
            }
            .padding()
        }
    }
    
    func takeScreenshot() {
        let streamConfig = SCStreamConfiguration()
        
        // Convert NSScreen to SCDisplay
        guard let mainDisplayID = NSScreen.main?.deviceDescription[NSDeviceDescriptionKey("NSScreenNumber")] as? CGDirectDisplayID,
              let mainDisplay = SCShareableContent.current.displays.first(where: { $0.displayID == mainDisplayID }) else {
            print("Unable to get main display")
            return
        }
        
        let filter = SCContentFilter(display: mainDisplay, including: [])
        
        do {
            let stream = try SCStream(filter: filter, configuration: streamConfig, delegate: nil)
            try stream.addStreamOutput(self, type: .screen, sampleHandlerQueue: DispatchQueue.main)
            try stream.startCapture()
        } catch {
            print("Failed to start screen capture: \(error.localizedDescription)")
        }
    }
}

extension ContentView: SCStreamOutput {
    func stream(_ stream: SCStream, didOutputSampleBuffer sampleBuffer: CMSampleBuffer, of type: SCStreamOutputType) {
        guard type == .screen else { return }
        
        if let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) {
            let ciImage = CIImage(cvImageBuffer: imageBuffer)
            let rep = NSCIImageRep(ciImage: ciImage)
            let nsImage = NSImage(size: rep.size)
            nsImage.addRepresentation(rep)
            
            let savePanel = NSSavePanel()
            savePanel.allowedFileTypes = ["png"]
            savePanel.begin { (result) in
                if result == .OK, let url = savePanel.url {
                    nsImage.savePNG(to: url)
                }
            }
        }
        
        stream.stopCapture { error in
            if let error = error {
                print("Failed to stop screen capture: \(error.localizedDescription)")
            }
        }
    }
}

extension NSImage {
    func savePNG(to url: URL) {
        guard let tiffData = tiffRepresentation,
              let bitmap = NSBitmapImageRep(data: tiffData),
              let data = bitmap.representation(using: .png, properties: [:]) else { return }
        
        do {
            try data.write(to: url)
        } catch {
            print("Failed to save image: \(error.localizedDescription)")
        }
    }
}
