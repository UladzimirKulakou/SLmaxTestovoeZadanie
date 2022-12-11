//
//  TextBindingManager.swift
//  SlmaxTestovoeZadanie
//
//  Created by Владимир  on 5.12.22.
//

import Foundation

class TextBindingManager: ObservableObject {
    @Published var text = "" {
        didSet {
            if text.count > characterLimit && oldValue.count <= characterLimit {
                text = oldValue
            }
        }
    }
    let characterLimit: Int

    init(limit: Int = 5){
        characterLimit = limit
    }
}
