//
//  GeneralPreferences.swift
//  MainApplication
//
//  Created by HIROKI IKEUCHI on 2022/01/31.
//

import Cocoa

class GeneralPreferences {
    
    enum UserDefaultsKey: String {
        case GeneralPreferences_AccountURL
        case GeneralPreferences_LaunchAtLogin = "launchAtLogin"
    }
    
    static let shared = GeneralPreferences()
    
    init() {
        UserDefaults.standard.register(defaults: [
            UserDefaultsKey.GeneralPreferences_AccountURL.rawValue : "",
            UserDefaultsKey.GeneralPreferences_LaunchAtLogin.rawValue: false
        ])
    }
    
    // FOR DEBUGGING
    func resetUserDefaults() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.GeneralPreferences_AccountURL.rawValue)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.GeneralPreferences_LaunchAtLogin.rawValue)
    }
    
    var accountURL: String {
        get {
            guard let accountName = UserDefaults.standard.string(forKey: UserDefaultsKey.GeneralPreferences_AccountURL.rawValue) else {
                return ""
            }
            return accountName
        }
        
        set(accountURL) {
            UserDefaults.standard.set(accountURL, forKey: UserDefaultsKey.GeneralPreferences_AccountURL.rawValue)
        }
    }
    
    var launchAtLogin: NSControl.StateValue {
        get {
            return NSControl.StateValue(UserDefaults.standard.integer(forKey: UserDefaultsKey.GeneralPreferences_LaunchAtLogin.rawValue))
        }
        
        set(launchAtLogin) {
            UserDefaults.standard.set(launchAtLogin, forKey: UserDefaultsKey.GeneralPreferences_LaunchAtLogin.rawValue)
        }
    }
    
}
