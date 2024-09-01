//
//  ShapeStyle+Gradients.swift
//  HeartAnimation
//
//  Created by Víctor Barrios Sánchez on 1/9/24.
//

import SwiftUI

extension ShapeStyle where Self == AngularGradient {
    static func rainbowAngularGradient() -> AngularGradient {
        .angularGradient(
            colors: [
                .red, .yellow, .green, .blue, .purple, .red
            ],
            center: .center,
            startAngle: .zero,
            endAngle: .degrees(360)
        )
    }
}
