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

public class LoaderView: UIView {
    private var hostingController: UIHostingController<LoaderAnimation>?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoaderAnimation()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLoaderAnimation()
    }
    
    private func setupLoaderAnimation() {
        // Create LoaderAnimation SwiftUI view
        let loaderAnimation = LoaderAnimation(color: .blue)
        
        // Initialize UIHostingController with LoaderAnimation
        hostingController = UIHostingController(rootView: loaderAnimation)
        hostingController?.view.backgroundColor = .clear
        
        // Add the hostingController's view to the LoaderView
        if let hostingView = hostingController?.view {
            addSubview(hostingView)
            
            // Set up constraints or frame for the hostingController's view
            hostingView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                hostingView.leadingAnchor.constraint(equalTo: leadingAnchor),
                hostingView.trailingAnchor.constraint(equalTo: trailingAnchor),
                hostingView.topAnchor.constraint(equalTo: topAnchor),
                hostingView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
    }
    
    public func load() {
        // You can add additional setup or start animations if needed
    }
}
