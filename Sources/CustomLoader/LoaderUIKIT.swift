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
        customizeLoader()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customizeLoader()
    }
    
    public func customizeLoader(colors: UIColor = .blue) {
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
}
