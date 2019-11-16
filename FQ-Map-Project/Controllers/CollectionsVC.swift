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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.register(CollectionsCVCell.self, forCellWithReuseIdentifier: "CollectionsCVCell")
        return cv
    }()
    
    lazy var createCollectionButton: UIBarButtonItem = {
        let butt = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonPressed))
       return butt
    }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        delegation()
        setUpVCViews()
        setUpNavBarView()
        addSubViews()
        constrainTableView()
    }
    
    // MARK: - Private Methods
    private func addSubViews() {
        view.addSubview(collectionsCV)
    }
    
    private func setUpVCViews() {
        view.backgroundColor = .white
    }
    
    private func setUpNavBarView() {
        self.navigationItem.rightBarButtonItem = createCollectionButton
    }
    
    @objc func plusButtonPressed() {
        let createVC = CreateCollectionVC()
        self.navigationController?.pushViewController(createVC, animated: true)
    }
    
    private func delegation() {
        collectionsCV.dataSource = self
        collectionsCV.delegate = self

    }
    
    // MARK: - Constraint Methods
    private func constrainTableView() {
        collectionsCV.translatesAutoresizingMaskIntoConstraints = false
        
        [collectionsCV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), collectionsCV.leadingAnchor.constraint(equalTo: view.leadingAnchor), collectionsCV.trailingAnchor.constraint(equalTo: view.trailingAnchor), collectionsCV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)].forEach({$0.isActive = true})
    }
    

}

// MARK: - Extensions
extension CollectionsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionsCV.dequeueReusableCell(withReuseIdentifier: "CollectionsCVCell", for: indexPath) as? CollectionsCVCell {
            cell.backgroundColor = .red
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

extension CollectionsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 125, height: 125)
    }
}


extension CollectionsVC: UICollectionViewDelegate {}

