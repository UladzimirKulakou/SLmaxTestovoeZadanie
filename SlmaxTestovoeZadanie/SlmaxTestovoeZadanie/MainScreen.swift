//
//  MainScreen.swift
//  SlmaxTestovoeZadanie
//
//  Created by Владимир  on 5.12.22.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        VStack{
            TopScreenImage()
            Task()
            Task()
            Spacer()
            CreateNewTask()
        }
        .padding(.bottom, 40)
        .ignoresSafeArea()
        
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
