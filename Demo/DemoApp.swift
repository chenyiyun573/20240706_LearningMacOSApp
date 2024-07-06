import SwiftUI

@main
struct MyApp: App {
    @StateObject private var globalEventMonitor = GlobalEventMonitor()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    globalEventMonitor.startMonitoring()
                }
                .onDisappear {
                    globalEventMonitor.stopMonitoring()
                }
        }
    }
}

