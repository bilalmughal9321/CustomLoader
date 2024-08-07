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


struct LoaderAnimationView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIHostingController<LoaderAnimation> {
        let loaderAnimation = LoaderAnimation()
        return UIHostingController(rootView: loaderAnimation)
    }
    
    func updateUIViewController(_ uiViewController: UIHostingController<LoaderAnimation>, context: Context) {
        uiViewController.rootView = LoaderAnimation()
    }
}


public class CustomLoaderAnimation: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let loaderAnimation = LoaderAnimationView()
        
        let hostingController = UIHostingController(rootView: loaderAnimation)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        // Set constraints or frame for the hostingController's view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hostingController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hostingController.view.widthAnchor.constraint(equalToConstant: 150),
            hostingController.view.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
