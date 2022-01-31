//
//  GeneralPreferences.swift
//  MainApplication
//
//  Created by HIROKI IKEUCHI on 2022/01/31.
//

import Cocoa

class GeneralPreferences {
    
    static let shared = GeneralPreferences()
    
    // MARK: - Enum
    
    enum UserDefaultsKey: String {
        case GeneralPreferences_LaunchAtLogin = "launchAtLogin"
    }
    
    // MARK: - LifeCycle
    
    init() {
        UserDefaults.standard.register(defaults: [
            UserDefaultsKey.GeneralPreferences_LaunchAtLogin.rawValue: false
        ])
    }
    
    // MARK: - DEBUGGING
    
    func resetUserDefaults() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.GeneralPreferences_LaunchAtLogin.rawValue)
    }
    
    // MARK: - Variables
    
    var launchAtLogin: NSControl.StateValue {
        get {
            return NSControl.StateValue(UserDefaults.standard.integer(forKey: UserDefaultsKey.GeneralPreferences_LaunchAtLogin.rawValue))
        }
        
        set(launchAtLogin) {
            UserDefaults.standard.set(launchAtLogin, forKey: UserDefaultsKey.GeneralPreferences_LaunchAtLogin.rawValue)
        }
    }
    
}
