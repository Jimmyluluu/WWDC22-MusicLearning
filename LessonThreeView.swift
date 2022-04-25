//
//  File.swift
//  LearingMusic
//
//  Created by 魯敬元 on 2022/4/19.
//

import SwiftUI
import AVFoundation
import Foundation


let sd1 = [
    note(name1: "C3", name2: "Do"),
    note(name1: "D3", name2: "Re"),
    note(name1: "E3", name2: "Mi"),
    note(name1: "F3", name2: "Fa")
    
]
let sd2 = [
    note(name1: "G3", name2: "So"),
    note(name1: "A3", name2: "La"),
    note(name1: "B3", name2: "Si"),
    note(name1: "C4", name2: "Do")
]

struct LessonThreeView: View {
    
    @State private var isShowingDetailView = false
    var body: some View {
        ZStack {
            Color(hex:"#E1F7FF").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Lesson Three - Read Sheet Music")
                    .font(.largeTitle)
                    .foregroundColor(Color(hex:"#404654"))
                    .fontWeight(.heavy)
                    .offset(x: 0, y: -20)
                    .padding(80)
                Text("If we want to play music, we need to know sheet muisc or numbered musical notation.")
                    .font(.title)
                    .foregroundColor(Color(hex:"#404654"))
                    .offset(x: 0, y: -50)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Image("SheetMusic").resizable().padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).frame(width:750, height: 300, alignment: .center)
                    HStack {
                        ForEach(sd1, id:\.name1) { s in
                            VStack {
                                Image(systemName: "arrow.up").resizable().frame(width: 30, height: 50, alignment: .center)
                                Text(s.name2).font(.title)
                            }.padding().offset(x: 70, y: 0)
                        }
                        ForEach(sd2, id:\.name1) { s in
                            VStack {
                                Image(systemName: "arrow.up").resizable().frame(width: 30, height: 50, alignment: .center)
                                Text(s.name2).font(.title)
                            }.padding().offset(x: 90, y: 0)
                        }
                    }.offset(x: 0, y: -50)
                }.padding().offset(x: 0, y: -70)
                VStack(alignment: .leading) {
                    Text("Four-four time, it represented that there have four time in a bar.").font(.title).foregroundColor(Color(hex:"#404654"))
                Text("So, the sheet music shows that there have two bars.  notations.")
                        .font(.title).foregroundColor(Color(hex:"#404654"))
                    Text("And, one bar has four times.")
                        .font(.title).foregroundColor(Color(hex:"#404654"))
                }.padding().offset(x: 0, y: -100)
                
                NavigationLink (destination: LessonFourView()){
                    Text("Next")
                        .frame(width: 120, height: 40, alignment: .center).foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(hex: "FB93B2")))
                    
                }.navigationBarBackButtonHidden(true).padding().offset(x: 0, y: -100)
            }
            
        }
    }
}
