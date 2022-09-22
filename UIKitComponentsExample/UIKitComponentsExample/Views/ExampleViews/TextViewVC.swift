//
//  TextViewVC.swift
//  UIKitComponentsExample
//
//  Created by Kevin Waltz on 05.09.22.
//

import UIKit
import UIKitComponents
import Combine

class TextViewVC: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        
        setupElements()
        
        subscribeToCurrentText()
        subscribeToEditingState()
    }
    
    
    
    // MARK: - Variables
    
    var subscriptions = Set<AnyCancellable>()
    
    private let labelWidth: CGFloat = 200
    private let labelHeight: CGFloat = 200
    
    
    
    // MARK: - Elements
    
    private let textView = BaseTextView(placeholder: "Enter text ...", font: .systemFont(ofSize: 16, weight: .semibold), backgroundColor: .secondarySystemGroupedBackground, cornerRadius: 12, padding: 12)
    
    private func setupElements() {
        view.addSubview(textView)
        textView.anchor(centerX: view.centerXAnchor, top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 24, width: labelWidth, height: labelHeight)
    }
    
    
    
    // MARK: - Functions
    
    /**
     Subscribe to the TextView's current text value via Combine. A new value is returned each time the text is changed.
     
     If you assign the value to something in your view, we recommend you use [weak self].
     */
    private func subscribeToCurrentText() {
        textView.currentText
            .sink { text in
                print("The TextViews's current text: ", text)
            }
            .store(in: &subscriptions)
    }
    
    /**
      Subscribe to the TextView's editing state. A boolean is returned whether the TextView is being edited.
      
      If you assign the value to something in your view, we recommend you use [weak self].
      */
     private func subscribeToEditingState() {
         textView.isInEditMode
             .sink { isInEditMode in
                 print("The TextViews's is in edit mode: ", isInEditMode)
             }
             .store(in: &subscriptions)
     }
    
}
