//
//  TopScreenImage.swift
//  SlmaxTestovoeZadanie
//
//  Created by Владимир  on 4.12.22.
//

import SwiftUI

struct TopScreenImage: View {
    var body: some View {
        ZStack {
            Image("Rectangle 5")
            Image("Rectangle 4")
            Text("Заметки")
                .font(.custom("Raleway-SemiBold", fixedSize: 28))
                .foregroundColor(.white)
        }
    }
}

struct TopScreenImage_Previews: PreviewProvider {
    static var previews: some View {
        TopScreenImage()
    }
}
