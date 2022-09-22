//
//  TextFieldVC.swift
//  UIKitComponentsExample
//
//  Created by Kevin Waltz on 05.09.22.
//

import UIKit
import UIKitComponents
import Combine

class TextFieldVC: UIViewController {
    
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
    private let labelHeight: CGFloat = 44
    
    
    
    // MARK: - Elements
    
    private let textField = BaseTextField(placeholder: "Enter text ...", textAlignment: .center, font: .systemFont(ofSize: 16, weight: .semibold), returnKeyType: .done, backgroundColor: .secondarySystemGroupedBackground, cornerRadius: 12)
    
    private func setupElements() {
        view.addSubview(textField)
        textField.anchor(centerX: view.centerXAnchor, top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 24, width: labelWidth, height: labelHeight)
    }
    
    
    
    // MARK: - Functions
    
    /**
     Subscribe to the TextView's current text value via Combine. A new value is returned each time the text is changed.
     
     If you assign the value to something in your view, we recommend you use [weak self].
     */
    private func subscribeToCurrentText() {
        textField.currentText
            .sink { text in
                print("The TextField's current text: ", text)
            }
            .store(in: &subscriptions)
    }
    
    /**
      Subscribe to the TextView's editing state. A boolean is returned whether the TextView is being edited.
      
      If you assign the value to something in your view, we recommend you use [weak self].
      */
     private func subscribeToEditingState() {
         textField.isInEditMode
             .sink { isInEditMode in
                 print("The TextField's is in edit mode: ", isInEditMode)
             }
             .store(in: &subscriptions)
     }
    
}
