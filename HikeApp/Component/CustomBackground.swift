//
//  CustomBackground.swift
//  HikeApp
//
//  Created by Furkan İSLAM on 29.06.2024.
//

import SwiftUI

struct CustomBackground: View {
    var body: some View {
        ZStack {
            // Mark: -3. Depth
            
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            // Mark: -2. Light
            
            Color.colorGreenLight
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.85)
            // Mark: -1. Surface
            
            
            LinearGradient(
                colors: [
                .customGreenLight,
                .customGreenMedium], startPoint: .top, endPoint: .bottom)
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackground()
        .padding()
}
