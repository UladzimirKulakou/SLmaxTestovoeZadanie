//
//  CoreDataManager.swift
//  SlmaxTestovoeZadanie
//
//  Created by Владимир  on 7.12.22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentConteiner: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        
        persistentConteiner = NSPersistentContainer(name: "SlmaxTestovoeZadanie")
        persistentConteiner.loadPersistentStores { description, error in
            
            if let error = error {
                fatalError("Unable to initialize CoreData \(error)")
            }
            
        }
    }
    
    
    
}
