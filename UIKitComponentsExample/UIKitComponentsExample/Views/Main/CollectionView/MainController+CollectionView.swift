//
//  MainController+TableView.swift
//  UIKitComponentsExample
//
//  Created by Kevin Waltz on 05.09.22.
//

import UIKit
import UIKitComponents

extension MainController {
    
    // MARK: - Setup
    
    func setupCollectionView() {
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: "cellID")
        
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
    }
    
    
    
    // MARK: - DataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ExampleItem.allCases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as? MainCell else { return UICollectionViewCell() }
        cell.item = ExampleItem(rawValue: indexPath.item)
        return cell
    }
    
    
    
    // MARK: - Delegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.endEditing(true)
        collectionView.deselectItem(at: indexPath, animated: true)
        
        guard let item = ExampleItem(rawValue: indexPath.item) else { return }
        
        let controller = item.correspondingView
        controller.navigationItem.title = item.title
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    // MARK: - FlowDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width - 32, height: 48)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
}
