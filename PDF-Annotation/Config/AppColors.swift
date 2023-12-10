//
//  AppColors.swift
//  PDF-Annotation
//
//  Created by Pengkhieng Kim on 10/12/23.
//

import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}

class AppColors {
    static let shared = AppColors()
//    main color
    let primaryColor    = Color(hex: 0x1C4076)
    let secondaryColor  = Color(hex: 0xEE7D22)
    
//    config color
    let backgroundColor = Color(hex: 0xEE7D22)
    let darkColor       = Color(hex: 0xEE7D22)
    let lightColor      = Color(hex: 0xEE7D22)
    
//    white color
    let whiteColor      = Color.white
    let whiteFFFFFF     = Color(hex: 0xFFFFFF)

//    red color
    let redColor        = Color.red
    let red963A09       = Color(hex: 0x963A09)
    let redDF2A54       = Color(hex: 0xDF2A54)
    
//    black color
    let blackColor      = Color.black
    let black202020     = Color(hex: 0x202020)

//    blue color
    let blueColor       = Color.blue
    let blue006BA5      = Color(hex: 0x006BA5)
    let blueB2CAE0      = Color(hex: 0xB2CAE0)
    let blue2A88DE      = Color(hex: 0x2A88DE)
    
//    green color
    let greenColor      = Color.green
    let green1F9B31     = Color(hex: 0x1F9B31)
    
//    grey color
    let greyColor       = Color.gray
    let grey5A5A5A      = Color(hex: 0x5A5A5A)
    let grey868686      = Color(hex: 0x868686)
    let greyE3E3E3      = Color(hex: 0xE3E3E3)
    let greyF6F6F6      = Color(hex: 0xF6F6F6)
    
//    orange color
    let orangeColor     = Color.orange
    let orangeEE7D22    = Color(hex: 0xEE7D22)

//    yellow color
    let yellowColor     = Color.yellow
    let yellowD3CC39    = Color(hex: 0xD3CC39)
    let yellowF6FDF4    = Color(hex: 0xF6FDF4)
    
//    pink color
    let pinkColor       = Color.pink
    
    private init() {}
}

