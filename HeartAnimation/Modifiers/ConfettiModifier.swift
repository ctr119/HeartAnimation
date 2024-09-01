//
//  ConfettiModifier.swift
//  HeartAnimation
//
//  Created by Víctor Barrios Sánchez on 31/8/24.
//

import SwiftUI

struct ConfettiModifier<T: ShapeStyle>: ViewModifier {
    // Gorwing circle
    @State private var circleGrowingSize = 0.00001
    @State private var strokeMultiplier = 1.0
    
    // Confetti
    @State private var confettiIsHidden = true
    @State private var confettiMovement = 0.7 // 70% of the radius
    @State private var confettiScale = 1.0
    
    // Content
    @State private var contentsScale = 0.00001
    
    private let speed: CGFloat = 0.3
    private let areaOffset: CGFloat = 10
    
    var color: T
    var size: Double
    
    func body(content: Content) -> some View {
        content
            .hidden()
            .padding(areaOffset)
            .overlay {
                ZStack {
                    GeometryReader { proxy in
                        // Growing circle
                        Circle()
                            .strokeBorder(color, lineWidth: (proxy.size.width / 2) * strokeMultiplier)
                            .scaleEffect(circleGrowingSize)
                        
                        // Confetti circles (smaller)
                        ForEach(0..<15) { i in
                            Circle()
                                .fill(color)
                                .frame(
                                    width: size + sin(Double(i)),
                                    height: size + sin(Double(i))
                                )
                                .scaleEffect(confettiScale)
                                .offset(
                                    x: proxy.size.width / 2 * confettiMovement + (i.isMultiple(of: 2) ? size : 0)
                                )
                                .rotationEffect(.degrees(24 * Double(i)))
                                .offset(
                                    x: (proxy.size.width - size) / 2,
                                    y: (proxy.size.height - size) / 2
                                )
                                .opacity(confettiIsHidden ? 0 : 1)
                        }
                        
                    }
                    
                    // The content passed by at the beginning, but scaled
                    content
                        .scaleEffect(contentsScale)
                }
            }
            .padding(-areaOffset)
            .onAppear {
                // MARK: - Animation triggers
                
                // MARK: - #1. Growing cirle
                withAnimation(.easeIn(duration: speed)){
                    circleGrowingSize = 1
                }
                withAnimation(.easeOut(duration: speed).delay(speed)) {
                    strokeMultiplier = 0.00001
                }
                
                // MARK: - #3. Content
                withAnimation(.interpolatingSpring(stiffness: 50, damping: 5).delay(speed)) {
                    contentsScale = 1
                }
                
                // MARK: - #2. Confetti
                withAnimation(.easeOut(duration: speed).delay(speed * 1.25)) {
                    confettiIsHidden = false
                    confettiMovement = 1.2 // 120%
                }
                withAnimation(.easeOut(duration: speed).delay(speed * 2)) {
                    confettiScale = 0.00001
                }
            }
    }
}
