//
//  StackViewVC.swift
//  UIKitComponentsExample
//
//  Created by Kevin Waltz on 05.09.22.
//

import UIKit
import UIKitComponents

class StackViewVC: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        
        setupElements()
    }
    
    
    
    // MARK: - Variables
    
    private let labelWidth: CGFloat = 96
    private let labelHeight: CGFloat = 44
    
    
    
    // MARK: - Elements
    
    private let horizontalView1 = BaseView(backgroundColor: .red)
    private let horizontalView2 = BaseView(backgroundColor: .blue)
    private lazy var horizontalStackView = BaseStackView(arrangedSubviews: [horizontalView1, horizontalView2], spacing: 12, axis: .horizontal, distribution: .fillEqually)
    
    private let verticalView1 = BaseView(backgroundColor: .red)
    private let verticalView2 = BaseView(backgroundColor: .blue)
    private lazy var verticalStackView = BaseStackView(arrangedSubviews: [verticalView1, verticalView2], axis: .vertical, distribution: .fillEqually)
    
    private func setupElements() {
        view.addSubview(horizontalStackView)
        view.addSubview(verticalStackView)
        
        horizontalStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 24, paddingRight: -24, height: 44)
        verticalStackView.anchor(top: horizontalStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 24, paddingRight: -24, height: 44)
    }
    
}
