//
//  CollectionPersistenceHelper.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/17/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct CollectionPersistenceHelper {
    
    // MARK: - Singleton
    static var standard = CollectionPersistenceHelper()
    
    func getCollections() throws -> [Collection] {
        return try persistenceHelper.getObjects()
    }
    
    func saveCollection(newCollection: Collection) throws {
        try persistenceHelper.save(newElement: newCollection)
    }
    
    private let persistenceHelper = PersistenceManager<Collection>(fileName: "collection.plist")
    
    private init() {}
}
