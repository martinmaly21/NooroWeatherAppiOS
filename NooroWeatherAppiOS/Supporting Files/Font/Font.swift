//
//  Font.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import SwiftUI

extension Font {
    static func poppins400(size: CGFloat) -> Font {
        return Font.custom("Poppins-Regular", size: size)
    }
    
    static func poppins500(size: CGFloat) -> Font {
        return Font.custom("Poppins-Medium", size: size)
    }
    
    static func poppins600(size: CGFloat) -> Font {
        return Font.custom("Poppins-SemiBold", size: size)
    }
}
