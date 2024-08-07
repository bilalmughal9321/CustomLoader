// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI

public struct LoaderAnimation: View {
    @State var isAnimating: Bool = false
    @State private var animationAmount = 1.0
    var frameWidth: CGFloat = 100.0
    var color: Color = .blue
    
    public init(color: Color = .red) {
        self.color = color
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
                    .animation(.easeInOut(duration: 2-CGFloat(index)*0.2).delay(CGFloat(index)*0.2).repeatForever(autoreverses: false), value: isAnimating)
            }
        }
       
        .onAppear{
            isAnimating = true
        }
        
    }
    
    func getCircleWidth(at index: Int) -> CGFloat {
        return frameWidth / 6 - CGFloat(index) * 1.5
    }
}

#Preview {
    LoaderAnimation()
}


public struct LoaderAnimationWrapper {
    public static func makeLoaderAnimationController(frameWidth: CGFloat, frame: CGRect) -> UIViewController {
        // Create LoaderAnimation view
        let loaderAnimationView = LoaderAnimation()
        
        // Create UIHostingController with LoaderAnimationView
        let hostingController = UIHostingController(rootView: loaderAnimationView)
        
        // Set the frame for the hostingController's view
        hostingController.view.frame = frame
        
        return hostingController
    }
}
