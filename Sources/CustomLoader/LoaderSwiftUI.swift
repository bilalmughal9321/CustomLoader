// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI


//MARK: - SwiftUI Public Loader Function


public struct LoaderSwiftUI: View {
    @State var isAnimating: Bool = false
    @State private var animationAmount = 1.0
    var frameWidth: CGFloat = 100.0
    var color: Color = .black
    var backgroundColor: Color
    
    public init(color: Color = .black, frameWidth: CGFloat = 50.0, backgroundColor: Color = .clear) {
        self.color = color
        self.frameWidth = frameWidth
        self.backgroundColor = backgroundColor
    }
    
    public var body: some View {
        
        ZStack {
            
            backgroundColor
//                .frame(width: frameWidth + 40, height: frameWidth + 40)
                .ignoresSafeArea()
                .clipShape(.rect(cornerRadius: 10))
                
            ForEach(0 ..< 5) { index in
                Circle()
                    .foregroundStyle(color)
                    .frame(width: getCircleWidth(at: index))
                    .offset(y: -frameWidth / 2)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .animation(
                        .easeInOut(duration: 2-CGFloat(index)*0.2)
                        .delay(CGFloat(index)*0.2)
                        .repeatForever(autoreverses: false), value: isAnimating)
            }
        }
       
        .onAppear{
            isAnimating = true
        }
        
    }
    
    func hide() {
        
    }
    
    func getCircleWidth(at index: Int) -> CGFloat {
        return frameWidth / 6 - CGFloat(index) * 1.5
    }
}

#Preview {
    LoaderSwiftUI()
}




