//
//  UIColor.swift
//
//
//  Created by Malte Schoppe on 25.08.21.
//

import UIKit
import SwiftUI

struct ColorComponents {
    var r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat
}

extension UIColor {
    
    func getComponents() -> ColorComponents? {
        
        guard let components = cgColor.components else { return nil }
        
        return  cgColor.numberOfComponents == 2 ? ColorComponents(r:components[0], g:components[0], b:components[0], a:components[1]) : ColorComponents(r:components[0], g:components[1], b:components[2], a:components[3])
    }
    
    public func interpolateRGBColorTo(fraction: CGFloat) -> UIColor {
        
        guard let c1 = self.getComponents(), let c2 = UIColor.green.getComponents() else { return .gray }
        
        var multiplier = max(0, fraction)
        multiplier = min(1, fraction)
        
        let red = c1.r + (c2.r - c1.r) * multiplier
        let green = c1.g + (c2.g - c1.g) * multiplier
        let blue = c1.b + (c2.b - c1.b) * multiplier
        let alpha = c1.a + (c2.a - c1.a) * multiplier
        
        return UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}

extension UIColor {
    public convenience init(hexString: String) {
        let hex = "#\(hexString)".trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}

extension Color {
    public init(uiColor: UIColor) {
        self.init(red: Double(uiColor.rgba.red), green: Double(uiColor.rgba.green), blue: Double(uiColor.rgba.blue), opacity: Double(uiColor.rgba.alpha))
    }
}
