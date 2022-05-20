//
//  AnalyticsEventProtocol.swift
//  POCTestAB
//
//  Created by João on 20/05/22.
//

import Foundation

protocol AnalyticsEventProtocol {
    var event: String { get }
    var parameters: [String: Any] { get }
}
