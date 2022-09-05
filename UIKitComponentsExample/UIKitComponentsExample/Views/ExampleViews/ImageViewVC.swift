//
//  ImageViewVC.swift
//  UIKitComponentsExample
//
//  Created by Kevin Waltz on 05.09.22.
//

import UIKit
import UIKitComponents

class ImageViewVC: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        
        setupElements()
    }
    
    
    
    // MARK: - Variables
    
    private let imageSize: CGFloat = 144
    
    
    
    // MARK: - Elements
    
    private let imageView = BaseImageView(image: UIImage(), cornerRadius: 12, contentMode: .scaleAspectFill, isOriginal: true)
    
    private func setupElements() {
        view.addSubview(imageView)
        imageView.anchor(centerX: view.centerXAnchor, top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 24, width: imageSize, height: imageSize)
    }
    
}
