//
//  ButtonTextVC.swift
//  UIKitComponentsExample
//
//  Created by Kevin Waltz on 05.09.22.
//

import UIKit
import UIKitComponents

class ButtonTextVC: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        
        setupElements()
    }
    
    
    
    // MARK: - Variables
    
    private let buttonWidth: CGFloat = 96
    private let buttonHeight: CGFloat = 44
    
    
    
    // MARK: - Elements
    
    private lazy var buttonText = ButtonWithText(title: "Button", font: .systemFont(ofSize: 16, weight: .semibold), backgroundColor: .secondarySystemFill, cornerRadius: buttonHeight / 2)
    
    private func setupElements() {
        view.addSubview(buttonText)
        
        buttonText.anchor(centerX: view.centerXAnchor, top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 24, width: buttonWidth, height: buttonHeight)
        buttonText.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    
    
    // MARK: - Functions
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        print("Button (Text) tapped!")
    }
    
}
