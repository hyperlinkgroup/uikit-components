//
//  MainCell.swift
//  UIKitComponentsExample
//
//  Created by Kevin Waltz on 05.09.22.
//

import UIKit
import UIKitComponents

class MainCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .secondarySystemGroupedBackground
        layer.cornerRadius = 12
        
        setupElements()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    // MARK: - Variables
    
    var item: ExampleItem? {
        didSet {
            guard let item = item else { return }
            titleLabel.text = item.title
        }
    }
    
    
    
    // MARK: - Elements
    
    private let titleLabel = BaseLabel(font: .systemFont(ofSize: 16))
    private let arrowIcon = BaseImageView(image: UIImage(systemName: "chevron.right") ?? UIImage(), tintColor: .secondaryLabel)
    
    private lazy var contentStackView = BaseStackView(arrangedSubviews: [titleLabel, UIView(), arrowIcon], axis: .horizontal, distribution: .fill)
    
    
    private func setupElements() {
        addSubview(contentStackView)
        contentStackView.fillSuperview(paddingLeft: 16, paddingRight: -16)
    }
    
    private func setupSelectionBackground() {
        let selectionView = UIView()
        selectionView.backgroundColor = .tertiarySystemGroupedBackground
        selectionView.layer.cornerRadius = 12
        
        selectedBackgroundView = selectionView
    }
    
}
