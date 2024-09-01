import SwiftUI

struct ContentView: View {
    @State private var isFavourite = false
    
    private let theColor = Color.orange
    private let fonts = [
        Font.body, 
        Font.largeTitle,
        Font.system(size: 72)
    ]
    
    var body: some View {
        VStack(spacing: 60) {
            ForEach(fonts, id: \.self) {
                Button(action: {
                    isFavourite.toggle()
                },
                       label: {
                    if isFavourite {
                        Image(systemName: "heart")
                            .foregroundStyle(theColor)
                            .symbolVariant(.fill)
                            .transition(
                                .confetti(
                                    color: theColor.gradient,
                                    size: 3
                                )
                            )
                    } else {
                        Image(systemName: "heart")
                            .foregroundStyle(.gray)
                    }
                })
                .font($0)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
