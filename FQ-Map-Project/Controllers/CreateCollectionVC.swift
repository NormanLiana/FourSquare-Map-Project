//
//  CreateCollectionVC.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/15/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class CreateCollectionVC: UIViewController {
    
    // MARK: - UI Objects
    lazy var collectionNameTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textColor = .black
        tf.textAlignment = .center
        tf.placeholder = "Enter new collection title"
        return tf
    }()
    
    lazy var createButton: UIBarButtonItem = {
        let butt = UIBarButtonItem(title: "Create", style: UIBarButtonItem.Style.plain, target: self, action: #selector(createButtonPressed))
        return butt
    }()
    
    lazy var collectionsCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.register(CollectionsCVCell.self, forCellWithReuseIdentifier: "CollectionsCVCell")
        return cv
    }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVCViews()
        setUpnavBarViews()
        addSubViews()
        constrainTextField()
        constrainCollectionView()
    }
    
    // MARK: - Objc Actions
    @objc func createButtonPressed() {
        createNewCollection()
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private Methods
    private func setUpVCViews() {
        view.backgroundColor = .gray
    }
    
    private func addSubViews() {
        view.addSubview(collectionNameTextField)
    }
    
    private func setUpnavBarViews() {
        navigationItem.rightBarButtonItem = createButton
    }
    
    private func createNewCollection() {
        guard let name = collectionNameTextField.text else {return}
        
        do {
           let newCollection = Collection(name: name, venues: nil)
            try CollectionPersistenceHelper.standard.saveCollection(newCollection: newCollection)
        } catch {
            print(error)
        }
    }
    
    // MARK: - Constraint Methods
    private func constrainTextField() {
        collectionNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        [collectionNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), collectionNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor), collectionNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor), collectionNameTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)].forEach({$0.isActive = true})
    }
    
    private func constrainCollectionView() {
        collectionsCV.translatesAutoresizingMaskIntoConstraints = false
        
        [collectionsCV.topAnchor.constraint(equalTo: collectionNameTextField.bottomAnchor), collectionsCV.leadingAnchor.constraint(equalTo: view.leadingAnchor), collectionsCV.trailingAnchor.constraint(equalTo: view.trailingAnchor), collectionsCV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)].forEach({$0.isActive = true})
    }
}

