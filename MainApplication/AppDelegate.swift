//
//  AppDelegate.swift
//  MainApplication
//
//  Created by HIROKI IKEUCHI on 2022/01/28.
//

import Cocoa
import ServiceManagement

extension Notification.Name {
    static let killLauncher = Notification.Name("killLauncher")
}

@main
class AppDelegate: NSObject, NSApplicationDelegate {


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let runningApps = NSWorkspace.shared.runningApplications
        let isRunning = !runningApps.filter { $0.bundleIdentifier == LancherConst.launcherAppId }.isEmpty
        if isRunning {
            DistributedNotificationCenter.default().post(name: .killLauncher, object: Bundle.main.bundleIdentifier!)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

