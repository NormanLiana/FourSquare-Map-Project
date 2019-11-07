//
//  CollectionsVC.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/4/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class CollectionsVC: UIViewController {
    
    // MARK: UI Objects
    lazy var collectionsCV: UICollectionView = {
        let tv = UICollectionView()
        tv.backgroundColor = .white
        // MARK: - TODO register cell
        return tv
    }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        constrainTableView()
    }
    
    // MARK: - Private Methods
    private func addSubViews() {
        view.addSubview(collectionsCV)
    }
    
    // MARK: - Constraint Methods
    private func constrainTableView() {
        collectionsCV.translatesAutoresizingMaskIntoConstraints = false
        
        [collectionsCV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), collectionsCV.leadingAnchor.constraint(equalTo: view.leadingAnchor), collectionsCV.trailingAnchor.constraint(equalTo: view.trailingAnchor), collectionsCV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)].forEach({$0.isActive = true})
    }
    

}
