//
//  MainController.swift
//  UIKitComponentsExample
//
//  Created by Kevin Waltz on 02.09.22.
//

import UIKit
import UIKitComponents

class MainController: BaseCollectionViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "UIKit Components"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        setupCollectionView()
    }
    
}
