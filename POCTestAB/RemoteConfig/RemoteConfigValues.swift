//
//  RemoteConfigValues.swift
//  POCTestAB
//
//  Created by João on 18/05/22.
//

import Foundation

enum RemoteConfigDefaultValues: String {
    case appPrimaryColor = "#14C38E"
    case titleButton = "Button"
}

enum RemoteConfigValues: String, CaseIterable {
    case appPrimaryColor
    case titleButton
    
    func set(_ value: String) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
    }
    
    func get() -> String {
        guard let defaultValue = RemoteConfigManager
                .shared
                .remoteConfig
                .defaultValue(forKey: self.rawValue)?
                .stringValue
        else {
            return ""
        }
        return UserDefaults.standard.string(forKey: self.rawValue) ?? defaultValue
    }
}
