//
//  GradienButtonStyle.swift
//  HikeApp
//
//  Created by Furkan İSLAM on 29.06.2024.
//

import Foundation
import SwiftUI

struct GradienButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional Statement with nil coalescing
                // Condition ? A : B
                configuration.isPressed ?
                // A: When user pressed the button
                LinearGradient(
                    colors:[.customGrayMedium,.customGrayLight],
                    startPoint: .top,
                    endPoint: .bottom)
                :
                // B: When the button is not pressed
                LinearGradient(
                    colors:[.customGrayLight, .customGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom
                )
            ) .cornerRadius(40)
    }
}
