//
//  BaseCollectionViewCell.swift
//
//  Created by Kevin Waltz on 26.05.20.
//

import UIKit

open class BaseCollectionViewCell: UICollectionViewCell {
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    public var selectionColor: UIColor? {
        didSet {
            guard let selectionColor else { return }
            
            let selectionView = UIView()
            selectionView.backgroundColor = selectionColor
            selectionView.layer.cornerRadius = 10
            
            selectedBackgroundView = selectionView
        }
    }
    
    
    
    /**
     This function can be overwritten to execute specific actions after init
     */
    open func setupViews() { }
    
}
