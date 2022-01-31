//
//  ViewController.swift
//  MainApplication
//
//  Created by HIROKI IKEUCHI on 2022/01/28.
//

import Cocoa
import ServiceManagement

class ViewController: NSViewController {

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        }
    }
    
    // MARK: - Actions
    
    @IBAction func launchAtLoginCheckboxClicked(_ sender: NSButton) {
        SMLoginItemSetEnabled(LauncherConst.launcherAppId as CFString, GeneralPreferences.shared.launchAtLogin.isOn)
    }
    
    @IBAction func checkSMLoginButtonClicked(_ sender: Any) {
        let jobDicts = SMCopyAllJobDictionaries(kSMDomainUserLaunchd).takeRetainedValue() as NSArray as! [[String:AnyObject]]
        let jobEnabled = jobDicts.filter { $0["Label"] as! String == LauncherConst.launcherAppId }.isEmpty == false
        print("SMLogin: \(jobEnabled)")
    }
    
    @IBAction func checkUserDefaultsButtonClicked(_ sender: Any) {
        print("UserDefaults: \(GeneralPreferences.shared.launchAtLogin)")
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        GeneralPreferences.shared.resetUserDefaults()
        SMLoginItemSetEnabled(LauncherConst.launcherAppId as CFString, GeneralPreferences.shared.launchAtLogin.isOn)
    }
}

