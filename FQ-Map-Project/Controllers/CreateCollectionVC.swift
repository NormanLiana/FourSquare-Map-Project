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

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVCViews()
        addSubViews()
        constrainTextField()
    }
    
    // MARK: - Private Methods
    private func setUpVCViews() {
        view.backgroundColor = .gray
    }
    
    private func addSubViews() {
        view.addSubview(collectionNameTextField)
    }
    
    // MARK: - Constraint Methods
    private func constrainTextField() {
        collectionNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        [collectionNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), collectionNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor), collectionNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor), collectionNameTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)].forEach({$0.isActive = true})
    }
    

}
