import SwiftUI

struct ContentView: View {
    @State private var isFavourite = false
    @State private var enableRainbowMode = false
    
    var body: some View {
        ZStack {
            heartButton
            
            VStack {
                Spacer()
                
                Toggle(isOn: $enableRainbowMode, label: {
                    HStack {
                        Image(systemName: "rainbow")
                            .foregroundStyle(.rainbowAngularGradient())
                        
                        Text("Enable rainbow mode?")
                            .monospaced()
                            .fontDesign(.monospaced)
                    }
                    .font(.headline)
                })
            }
            .padding()
        }
        .padding()
    }
    
    private var heartButton: some View {
        Button(
            action: {
                isFavourite.toggle()
            },
            label: {
                if isFavourite {
                    if enableRainbowMode {
                        Image(systemName: "heart")
                            .foregroundStyle(.rainbowAngularGradient())
                            .symbolVariant(.fill)
                            .transition(
                                .confetti(
                                    color: .rainbowAngularGradient(),
                                    size: 9
                                )
                            )
                    } else {
                        Image(systemName: "heart")
                            .foregroundStyle(.orange.gradient)
                            .symbolVariant(.fill)
                            .transition(
                                .confetti(
                                    color: .orange.gradient,
                                    size: 9
                                )
                            )
                    }
                } else {
                    Image(systemName: "heart")
                        .foregroundStyle(.gray)
                }
            }
        )
        .font(.system(size: 92))
    }
}

#Preview {
    ContentView()
}
