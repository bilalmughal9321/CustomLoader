// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI


//MARK: - SwiftUI Public Loader Function


public struct LoaderSwiftUI: View {
    @State var isAnimating: Bool = false
    @State private var animationAmount = 1.0
    var frameWidth: CGFloat = 100.0
    var color: Color = .black
    
    public init(color: Color = .black, frameWidth: CGFloat = 100.0) {
        self.color = color
        self.frameWidth = frameWidth
    }
    
    public var body: some View {
        
        ZStack {
            Color.clear
                .ignoresSafeArea()
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

//#Preview {
//    LoaderSwiftUI()
//}




