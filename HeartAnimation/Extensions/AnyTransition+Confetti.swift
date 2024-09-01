//
//  AnyTransition+Confetti.swift
//  HeartAnimation
//
//  Created by Víctor Barrios Sánchez on 31/8/24.
//

import SwiftUI

extension AnyTransition {
    static var confetti: AnyTransition {
        .modifier(
            active: ConfettiModifier(color: .blue, size: 3),
            identity: ConfettiModifier(color: .blue, size: 3)
        )
    }
    
    static func confetti<T: ShapeStyle>(color: T = .blue, size: Double = 3) -> AnyTransition {
        .modifier(
            active: ConfettiModifier(color: color, size: size),
            identity: ConfettiModifier(color: color, size: size)
        )
    }
}
