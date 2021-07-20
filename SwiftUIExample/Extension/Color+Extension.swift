//
//  Color+Extension.swift
//  SwiftUIExample
//
//  Created by Jovins on 2021/7/20.
//

import Foundation
import SwiftUI

extension Color {
    
    // eg: Color(hex: 0x5a5a5a)
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}
