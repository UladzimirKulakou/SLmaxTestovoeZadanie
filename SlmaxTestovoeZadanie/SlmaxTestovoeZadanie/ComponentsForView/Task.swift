//
//  Task.swift
//  SlmaxTestovoeZadanie
//
//  Created by Владимир  on 5.12.22.
//

import SwiftUI

struct Task: View {
    var body: some View {
        VStack{
            HStack(){
                Text("Заголовок")
                    .font(.custom("Raleway-SemiBold", fixedSize: 14))
                    .foregroundColor(Color.black)
                Divider()
                    .padding(.vertical, 11)
                Text("Краткий текст описание")
                    .font(.custom("Raleway-SemiBold", fixedSize: 8))
                    .multilineTextAlignment(.leading)
                Spacer()
                Button(action: {
                }) {
                    Image("arrowcircleright")
                }
            }
            .frame(height: 37)
            .padding(.horizontal)
            .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 1)
                .opacity(0.2)
        )
            .padding(.horizontal)
        }
    }
}

struct Task_Previews: PreviewProvider {
    static var previews: some View {
        Task()
    }
}
