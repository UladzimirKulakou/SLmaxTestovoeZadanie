//
//  MainScreen.swift
//  SlmaxTestovoeZadanie
//
//  Created by Владимир  on 5.12.22.
//

import SwiftUI

struct MainScreen: View {
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)]) private var allNotes: FetchedResults<Note>
    @Environment(\.managedObjectContext) private var viewContext

    @State private var offsets = [CGSize](repeating: CGSize.zero, count: 6)
    
    @GestureState private var dragOffset = CGSize.zero

    enum SwipeHorizontalDirection: String {
            case left, right, none
        }

        @State var swipeHorizontalDirection: SwipeHorizontalDirection = .none { didSet { print(swipeHorizontalDirection) } }

    var body: some View {
        VStack {
            TopScreenImage()

            ForEach(allNotes) { note in
                DraggableText(pushArrow: note.isArrowPush, content: note.content!, header: note.header!,start: note.isSwipeForDelete, note: note)
            }
            Spacer()
            CreateNewTask()
        }
            .padding(.bottom, 40)
            .ignoresSafeArea()
    }
}
struct DraggableText: View {
    enum SwipeHVDirection: String {
        case left, right, up, down, none
    }
    func detectDirection(value: DragGesture.Value) -> SwipeHVDirection {
    if value.startLocation.x < value.location.x - 24 {
                return .left
              }
              if value.startLocation.x > value.location.x + 24 {
                return .right
              }
              if value.startLocation.y < value.location.y - 24 {
                return .down
              }
              if value.startLocation.y > value.location.y + 24 {
                return .up
              }
      return .none
      }

    @GestureState var position: CGSize = .zero
    var pushArrow: Bool
    var content: String
    var header: String
    var start: Bool = false
    var note: Note
     @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        Task(pushArrow: pushArrow, header: header, content: content, startDelete: start, note: note)
            .offset(x: position.width)
            .gesture(
            DragGesture().updating($position, body: { value, state, transaction in
                print("value ",value.translation.width)
                          let direction = self.detectDirection(value: value)
                          if direction == .right {
                              print("left ",value.translation.width)
                             return note.isSwipeForDelete = true
                //              updateTask(note)
                          }
//                if direction == .left {
//                    print("left ",value.translation.width)
//                   return note.isSwipeForDelete = false
//
//      //              updateTask(note)
//                }
                
            })
        )
    }
}

struct MainScreen_Previews: PreviewProvider {

    static var previews: some View {
        let persistenceController = CoreDataManager.shared.persistentConteiner
        MainScreen().environment(\.managedObjectContext, persistenceController.viewContext)
    }
}
