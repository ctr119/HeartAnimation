import SwiftUI

struct ContentView: View {
    @State private var isFavourite = false
    
    var body: some View {
        VStack(spacing: 60) {
            Button(action: {
                isFavourite.toggle()
            },
                   label: {
                if isFavourite {
                    Image(systemName: "heart")
                        .foregroundStyle(.rainbowAngularGradient())
                        .symbolVariant(.fill)
                        .transition(
                            .confetti(
                                color: .rainbowAngularGradient(),
                                size: 3
                            )
                        )
                } else {
                    Image(systemName: "heart")
                        .foregroundStyle(.gray)
                }
            })
            .font(.system(size: 92))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
