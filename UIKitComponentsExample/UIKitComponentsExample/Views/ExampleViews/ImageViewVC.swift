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
    
    private let image = UIImage(named: "logo_spacesquad") ?? UIImage()
    private let imageWidth: CGFloat = 200
    private let imageHeight: CGFloat = 150
    
    
    
    // MARK: - Elements
    
    private lazy var imageView = BaseImageView(image: image, cornerRadius: 12, contentMode: .scaleAspectFill, isOriginal: true)
    
    private func setupElements() {
        view.addSubview(imageView)
        imageView.anchor(centerX: view.centerXAnchor, top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 24, width: imageWidth, height: imageHeight)
    }
    
}
