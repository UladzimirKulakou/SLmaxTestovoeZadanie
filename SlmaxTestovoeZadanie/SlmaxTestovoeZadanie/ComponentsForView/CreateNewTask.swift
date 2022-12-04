//
//  CreateNewTask.swift
//  SlmaxTestovoeZadanie
//
//  Created by Владимир  on 4.12.22.
//

import SwiftUI



struct CreateNewTask: View {

    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            TextField(text: $username) {
                Text("Название")
                    .font(.custom("Raleway-SemiBold", fixedSize: 14))
                    .foregroundColor(Color.black)
            }
            Divider()
            HStack {
                TextField(text: $password) {
                    Text("Текст описание")
                        .font(.custom("Raleway-SemiBold", fixedSize: 10))
                        .multilineTextAlignment(.leading)
                        .lineLimit(0)
                }
                Button(action: {
                }) {
                    Image("Vector")
                }
            }
        }
            .padding()
            .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
                .opacity(0.2)
        )
            .padding()
    }
}

struct CreateNewTask_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewTask()
    }
}
