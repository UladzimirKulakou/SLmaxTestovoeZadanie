//
//  Task.swift
//  SlmaxTestovoeZadanie
//
//  Created by Владимир  on 5.12.22.
//

import SwiftUI

struct Task: View {
    var pushArrow: Bool = false
    var header: String = "Название"
    var content: String = "Текст описание"
    var startDelete: Bool = false
    var note: Note
    @State var pushDelete: Bool = false
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)]) private var allNotes: FetchedResults<Note>
    @Environment(\.managedObjectContext) private var viewContext

    @State var timeRemaining = 5
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        
        VStack {
            HStack() {
                Text(header)
                    .font(.custom("Raleway-SemiBold", fixedSize: 14))
                    .foregroundColor(Color.black)
                    .frame(width: 75)
                    .padding(.horizontal)
                    .lineLimit(1)
                Divider()
                    .padding(.vertical, 11)
                Text(content)
                    .font(.custom("Raleway-Light", fixedSize: 8))
                    .multilineTextAlignment(.leading)
                    .frame(width: 105)
                    .lineLimit(1)
                Spacer()
                Button(action: {

                }) {
                    if note.isSwipeForDelete {
                        Button(action: {
                            self.pushDelete.toggle()
                            timeRemaining = 5
                            
                        }, label: {
                                RoundedRectangle(cornerRadius: 5)
                                    .overlay(Text("Удалить")
                                        .foregroundColor(.white)
                                        .font(.custom("Raleway-SemiBold", fixedSize: 12)))
                                    .frame(width: !pushDelete ? 100 : 0)
                                    .foregroundColor(.red)
                            })
                        if pushDelete {
                            Button(action: {
                                self.pushDelete.toggle()
                                timeRemaining = 5
                                note.isSwipeForDelete = false
                            }, label: {
                                    RoundedRectangle(cornerRadius: 5)
                                        .overlay(Text("\(timeRemaining)")

                                            .onReceive(timer) { _ in
                                            if timeRemaining > 0 {
                                                timeRemaining -= 1
                                                if timeRemaining == 0 {
                                                    viewContext.delete(note)
                                                    try? viewContext.save()

                                                }
                                            }
                                        }
                                            .foregroundColor(.white)
                                            .font(.custom("Raleway-SemiBold", fixedSize: 12)))
                                        .frame(width: startDelete ? 100 : 0)
                                        .foregroundColor(.red)

                                })
                        }
                    } else {
                        
                        Button(action: {
                        
                        }, label: {
                            Image("arrowcircleright")
                                .padding(.horizontal)
                            })
                        
                    }



                }
                    .padding(.trailing, 0)
            }
                .frame(height: 37)
            //.padding(.horizontal)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .opacity(0.2)
            )
                .padding(.horizontal)
            if pushArrow {
                VStack {
                    HStack {
                        Spacer()
                        Text("12.12.2022")
                            .font(.custom("Raleway-Light", fixedSize: 8))
                            .padding(.vertical, 2)
                            .padding(.trailing)
                    }
                    Text("Идейные соображения высшего порядка, а также реализация намеченных плановых заданий представляет собой интересный эксперимент проверки модели развития")
                        .font(.custom("Raleway-Light", fixedSize: 10))
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding(.horizontal)
                        .padding(.bottom)

                    Divider()

                }
                    .padding(.horizontal)
            }

        }
    }
}

struct Task_Previews: PreviewProvider {

    static var previews: some View {
        Task(pushArrow: true, note: Note())
    }
}
