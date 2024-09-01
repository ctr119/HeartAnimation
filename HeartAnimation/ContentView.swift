import SwiftUI

struct ContentView: View {
    @State private var isFavourite = false
    
    var body: some View {
        VStack(spacing: 60) {
            heartButton
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
                    Image(systemName: "heart")
                        .foregroundStyle(.orange.gradient)
                        .symbolVariant(.fill)
                        .transition(
                            .confetti(
                                color: .orange.gradient,
                                size: 9
                            )
                        )
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
