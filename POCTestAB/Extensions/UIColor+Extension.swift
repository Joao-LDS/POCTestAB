//
//  UIColor+Extension.swift
//  POCTestAB
//
//  Created by João on 20/05/22.
//

import UIKit

extension UIColor {
    public convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexTemp: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue: UInt64 = 0
        
        if hexTemp.hasPrefix("#") {
            hexTemp.remove(at: hexTemp.startIndex)
        }
        
        if hexTemp.count == 6 {
            Scanner(string: hexTemp).scanHexInt64(&rgbValue)
        }
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
