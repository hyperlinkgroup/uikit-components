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
            guard let color = selectionColor else { return }
            
            let selectionView = UIView()
            selectionView.backgroundColor = color
            selectionView.layer.cornerRadius = 10
            
            selectedBackgroundView = selectionView
        }
    }
    
    
    
    /**
     Aktion nach der Initialisierung.
     
     Diese Aktion kann überschrieben werden, um im ViewController spezifische Aktionen nach der Initialisierung durchzuführen.
     */
    open func setupViews() { }
    
}
