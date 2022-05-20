//
//  RemoteConfigValues.swift
//  POCTestAB
//
//  Created by João on 18/05/22.
//

import Foundation
import Firebase

class RemoteConfigManager {
    static let shared = RemoteConfigManager()
    let remoteConfig = RemoteConfig.remoteConfig()
    
    private init() {
        loadDefaultValues()
        fetchCloudValues()
    }
    
    func loadDefaultValues() {
        let appDefaults: [String: Any?] = [
            RemoteConfigValues.appPrimaryColor.rawValue: RemoteConfigDefaultValues.appPrimaryColor.rawValue,
            RemoteConfigValues.titleButton.rawValue: RemoteConfigDefaultValues.titleButton.rawValue
        ]
        remoteConfig.setDefaults(appDefaults as? [String: NSObject])
    }
    
    func activateDebugMode() {
        let settings = RemoteConfigSettings()
        /// Por padrão o Remote Config mantém cache dos valores buscados por 12hr, assim o client side não fica chamando o serviço frequentemente
        #if DEV || HML
        settings.minimumFetchInterval = 0
        #endif
        remoteConfig.configSettings = settings
    }
    
    func fetchCloudValues() {
        activateDebugMode()
        remoteConfig.fetchAndActivate { result, error in
            switch result {
            case .successFetchedFromRemote:
                print("DEBUG: Config Remote fetched.")
                for value in RemoteConfigValues.allCases {
                    if let rcValue = self.remoteConfig[value.rawValue].stringValue {
                        value.set(rcValue)
                        debugPrint("\(value):", rcValue)
                    }
                }
            case .successUsingPreFetchedData: break
            default: break
            }
        }
    }
}
