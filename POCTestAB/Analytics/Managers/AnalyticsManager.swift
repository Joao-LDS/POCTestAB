//
//  AnalyticsManager.swift
//  POCTestAB
//
//  Created by João on 20/05/22.
//

import Foundation
import Firebase

class AnalyticsManager {
    static let shared = AnalyticsManager()
    
    func trackEvent(_ event: AnalyticsEventProtocol) {
        Analytics.logEvent(event.event, parameters: event.parameters)
    }
}
