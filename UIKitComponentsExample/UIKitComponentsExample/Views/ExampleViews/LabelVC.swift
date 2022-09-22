//
//  LabelVC.swift
//  UIKitComponentsExample
//
//  Created by Kevin Waltz on 05.09.22.
//

import UIKit
import UIKitComponents

class LabelVC: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        
        setupElements()
    }
    
    
    
    // MARK: - Variables
    
    private let labelWidth: CGFloat = 200
    private let labelHeight: CGFloat = 44
    
    
    
    // MARK: - Elements
    
    private let label = BaseLabel(text: "Label", textAlignment: .center, font: .systemFont(ofSize: 16, weight: .semibold))
    
    private func setupElements() {
        view.addSubview(label)
        label.anchor(centerX: view.centerXAnchor, top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 24, width: labelWidth, height: labelHeight)
    }
    
}
