//
//  NSControl+BoolValue.swift
//  MainApplication
//
//  Created by HIROKI IKEUCHI on 2022/01/31.
//

import Cocoa

extension NSControl.StateValue {
    var isOn: Bool {
        return self == .on
    }
}
