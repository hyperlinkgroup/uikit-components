//
//  BaseCollectionViewCell.swift
//  
//
//  Created by Kevin Waltz on 02.09.22.
//

import UIKit

/**
 Subclass for a UICollectionViewCell.
 
 Show a shadow by setting 'setShadow' to true. Set a custom selection color for 'selectionColor'.
 
 To setup the cell itself, call 'setupViews' and call your functions in there.
 */
public class BaseCollectionViewCell: UICollectionViewCell {
    
    public init(color: UIColor,
                cornerRadius: CGFloat) {
        
        self.color = color
        self.cornerRadius = cornerRadius
        
        super.init(frame: .zero)
        
        backgroundColor = color
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        
        preservesSuperviewLayoutMargins = false
        layoutMargins = .zero
        
        setupViews()
        setupSelectionBackground()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.color = .systemBackground
        self.cornerRadius = 0
        
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !setShadow || traitCollection.userInterfaceStyle == .dark { return }
        
        contentView.layer.cornerRadius = cornerRadius
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 7)
        layer.shadowOpacity = 0.15
        layer.shadowRadius = 10
        layer.shadowPath = shadowPath.cgPath
    }
    
    
    
    // MARK: - Variables
    
    private var color: UIColor
    private var cornerRadius: CGFloat
    
    var setShadow = true
    
    lazy var selectionColor: UIColor? = color.withAlphaComponent(traitCollection.userInterfaceStyle == .dark ? 0.3 : 0.1) {
        didSet {
            setupSelectionBackground()
        }
    }
    
    
    
    // MARK: - Setup
    
    func setupViews() { }
    
    private func setupSelectionBackground() {
        guard let color = selectionColor else { return }
        
        let selectionView = UIView()
        selectionView.backgroundColor = color
        selectionView.layer.cornerRadius = cornerRadius
        
        selectedBackgroundView = selectionView
    }
    
}
