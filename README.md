20240706-0247-PT 
First version of demo to learn mac os app development. 
Based on a hello world empty mac os app using xcode. 
Modify the ContentView, and DemoApp. Add two views of mouse and keyboard. 
Realize a button to print, and initilization of app to print. 

However, the drawback is that the mouse and keyboard listener are limited to the app's canvas, but I want it to be global on mac. 
So the next step is to make the listener global. This version is 1.0.0.

20240706-0311-PT
I tried the code by GPT4 for gobalEventMonitor, the mouse listener works, but the keyboard does not. This version of code is 1.0.1.

20240706-0312-PT
I tried to code a button to take screenshots, code by GPT4, but the following errors happened: 'CGWindowListCreateImage' was deprecated in macOS 14.0: This API is deprecated. Please use ScreenCaptureKit's captureScreenshot APIs instead.; so it prints Failed to capture screenshot. This version of code is 1.0.2.


