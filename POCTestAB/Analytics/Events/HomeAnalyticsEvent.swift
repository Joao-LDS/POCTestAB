//
//  HomeAnalyticsEvent.swift
//  POCTestAB
//
//  Created by João on 20/05/22.
//

import Foundation

enum HomeAnalyticsEvent: AnalyticsEventProtocol {
    case button(String)
    
    var event: String {
        switch self {
        case .button:
            return "button"
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .button(let title):
            return makeParametersButton(title: title)
        }
    }
    
    func makeParametersButton(title: String) -> [String : Any] {
        return ["title": title]
    }
}
