//
//  ButtonImageVC.swift
//  UIKitComponentsExample
//
//  Created by Kevin Waltz on 05.09.22.
//

import UIKit
import UIKitComponents

class ButtonImageVC: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        
        setupElements()
    }
    
    
    
    // MARK: - Variables
    
    private let image = UIImage(systemName: "heart.fill") ?? UIImage()
    private let buttonSize: CGFloat = 44
    
    
    
    // MARK: - Elements
    
    private lazy var buttonImage = BaseButtonWithImage(image: image, tintColor: .systemBlue, backgroundColor: .secondarySystemFill, cornerRadius: buttonSize / 2)
    
    private func setupElements() {
        view.addSubview(buttonImage)
        
        buttonImage.anchor(centerX: view.centerXAnchor, top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 24, width: buttonSize, height: buttonSize)
        buttonImage.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    
    
    // MARK: - Functions
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        print("Button (Image) tapped!")
    }
    
}
