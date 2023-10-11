//
//  Color+.swift
//  LETSWIFT23
//
//  Created by jasu on 2023/05/14.
//  Copyright (c) 2023 jasu All rights reserved.
//

import SwiftUI

public extension Color {
    
    static var level1 = Color.white
    static var level2 = Color.white.opacity(0.9)
    static var level3 = Color.white.opacity(0.7)
    static var level4 = Color.white.opacity(0.5)
    
    static var primaryLevel1 = Color(hex: 0xC7DEFF)
    static var primaryLevel2 = Color(hex: 0xA9CBFF)
    static var primaryLevel3 = Color(hex: 0x7CA6FF)
    static var primaryLevel4 = Color(hex: 0x4F67F4)
    static var primaryLevel5 = Color(hex: 0x0f19cc)
    static var primaryLevel6 = Color(hex: 0x0609A6)
    
    static var background = Color(hex: 0x010451)
    static var codeBackground = Color(hex: 0x171B21)
    static var codeBackground2 = Color(hex: 0x292B34)
    
    static var scripBackgroundLevel1 = Color(hex: 0x222222)
    static var scripBackgroundLevel2 = Color(hex: 0x141414)
    static var scripBackgroundLevel3 = Color(hex: 0x101010)
    
    static var pointYellow = Color(hex: 0xFDF272)
    static var pointGreen = Color(hex: 0x9EF65D)
    static var pointRed = Color(hex: 0xEE84A2)
    
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
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
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
