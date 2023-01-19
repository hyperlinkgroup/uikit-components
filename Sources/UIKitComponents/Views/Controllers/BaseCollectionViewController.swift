//
//  BaseCollectionViewController.swift
//  
//
//  Created by Kevin Waltz on 05.09.22.
//

import UIKit

open class BaseCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Initialization
    
    public init() {
        super.init(collectionViewLayout: layout)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        collectionViewLayout.invalidateLayout()
    }
    
    
    
    // MARK: - Variables
    
    public let layout = UICollectionViewFlowLayout()
    
}
