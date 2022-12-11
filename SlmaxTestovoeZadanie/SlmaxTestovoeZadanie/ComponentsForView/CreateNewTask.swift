//
//  CreateNewTask.swift
//  SlmaxTestovoeZadanie
//
//  Created by Владимир  on 4.12.22.
//

import SwiftUI



struct CreateNewTask: View {

    @State private var header: String = ""
    @State private var content: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)]) private var allNotes: FetchedResults<Note>
    
    @ObservedObject var textBindingManager = TextBindingManager(limit: 25)
 
    private func saveTask() {
        
        do {
            let note = Note(context: viewContext)
            note.header = textBindingManager.text
            note.content = content
            note.date = Date()
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    var body: some View {
        VStack {
            
            TextField(text: $textBindingManager.text) {
                Text("Название")
                    .font(.custom("Raleway-SemiBold", fixedSize: 14))
                    .foregroundColor(Color.black)
            }
            Divider()
            HStack {
                TextField(text: $content) {
                    Text("Текст описание")
                        .font(.custom("Raleway-Light", fixedSize: 10))
                      //  .multilineTextAlignment(.leading)
                        .foregroundColor(Color.black)
//                        .lineLimit(nil)
                }
                Button(action: {
                    saveTask()
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
