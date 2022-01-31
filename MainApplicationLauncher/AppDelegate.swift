//
//  AppDelegate.swift
//  MainApplicationLauncher
//
//  Created by HIROKI IKEUCHI on 2022/01/28.
//

import Cocoa

extension Notification.Name {
    static let killLauncher = Notification.Name("killLauncher")
}

class AppDelegate: NSObject {

    @objc func terminate() {
        NSApp.terminate(nil)
    }
}

extension AppDelegate: NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        let mainAppIdentifier = "com.gmail.ikeh1024.MainApplication"
        let runningApps = NSWorkspace.shared.runningApplications
        let isRunning = !runningApps.filter { $0.bundleIdentifier == mainAppIdentifier }.isEmpty

        if !isRunning {
            DistributedNotificationCenter
                .default()
                .addObserver(self,
                             selector: #selector(self.terminate),
                             name: .killLauncher,
                             object: mainAppIdentifier)
            
            if !isRunning,
               let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: mainAppIdentifier) {
                let config = NSWorkspace.OpenConfiguration()
                NSWorkspace.shared.openApplication(at: url, configuration: config) { _, _ in
                }
            }
        }
        else {
            self.terminate()
        }
    }
}
