//
//  File.swift
//  
//
//  Created by Bilal Mughal on 07/08/2024.
//

import Foundation
import UIKit
import SwiftUI

//MARK: - UIKIT Public Loader Function
public class LoaderUIKIt: UIView {
    private var hostingController: UIHostingController<LoaderSwiftUI>?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
//        showLoader()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        showLoader()
    }
    
    public func showLoader(colors: UIColor = .blue) {
        // Create LoaderAnimation SwiftUI view
        let loaderAnimation = LoaderSwiftUI(color: Color(uiColor: colors))
        
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
    
    public func hideLoader() {
        // Remove the hostingController's view from the superview
        hostingController?.view.removeFromSuperview()
        hostingController = nil
    }
    
}
