//
//  ViewVC.swift
//  UIKitComponentsExample
//
//  Created by Kevin Waltz on 05.09.22.
//

import UIKit
import UIKitComponents

class ViewVC: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        
        setupElements()
    }
    
    
    
    // MARK: - Variables
    
    private let imageWidth: CGFloat = 200
    private let imageHeight: CGFloat = 150
    
    
    
    // MARK: - Elements
    
    private let baseView = BaseView(backgroundColor: .blue, cornerRadius: 12)
    
    private func setupElements() {
        view.addSubview(baseView)
        baseView.anchor(centerX: view.centerXAnchor, top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 24, width: imageWidth, height: imageHeight)
    }
    
}
