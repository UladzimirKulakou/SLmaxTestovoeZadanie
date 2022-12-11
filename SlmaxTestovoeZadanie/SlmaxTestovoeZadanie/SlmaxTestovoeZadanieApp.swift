//
//  SlmaxTestovoeZadanieApp.swift
//  SlmaxTestovoeZadanie
//
//  Created by Владимир  on 4.12.22.
//

import SwiftUI

@main
struct SlmaxTestovoeZadanieApp: App {
    let persistenceController = CoreDataManager.shared.persistentConteiner

    var body: some Scene {
        WindowGroup {
           MainScreen()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
