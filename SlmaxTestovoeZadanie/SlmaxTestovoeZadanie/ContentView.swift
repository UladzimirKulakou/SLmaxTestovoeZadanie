//
//  ContentView.swift
//  SlmaxTestovoeZadanie
//
//  Created by Владимир  on 4.12.22.
//

import SwiftUI
import CoreData


struct ContentView: View {
    enum SwipeHorizontalDirection: String {
            case left, right, none
        }

        @State var swipeHorizontalDirection: SwipeHorizontalDirection = .none { didSet { print(swipeHorizontalDirection) } }
    @State var timeRemaining = 10
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

//        var body: some View {
//            VStack {
//                Text(swipeHorizontalDirection.rawValue)
//            }
//            .gesture(
//                DragGesture()
//                    .onChanged {
//                        if $0.startLocation.x > $0.location.x {
//                            self.swipeHorizontalDirection = .left
//                        } else if $0.startLocation.x == $0.location.x {
//                            self.swipeHorizontalDirection = .none
//                        } else {
//                            self.swipeHorizontalDirection = .right
//                        }
//            })
//        }
//    

        var body: some View {
            Text("\(timeRemaining)")
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
