//
//  File.swift
//  LearingMusic
//
//  Created by 魯敬元 on 2022/4/18.
//

import SwiftUI
import AVFoundation
import Foundation



struct note {
    let name1: String
    let name2: String
}

let sod = [
    note(name1: "C3", name2: "Do"),
    note(name1: "D3", name2: "Re"),
    note(name1: "E3", name2: "Mi"),
    note(name1: "F3", name2: "Fa"),
    note(name1: "G3", name2: "So"),
    note(name1: "A3", name2: "La"),
    note(name1: "B3", name2: "Si")
]

struct LessonTwoView: View {
    @State var alphaValue: Double = 0
    @State var alphaValue2: Double = 0
    let path = Bundle.main.path(forResource: "Play", ofType: "mp3")
    var body: some View {
        ZStack {
            Color(hex:"#E1F7FF").edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 20.0) {
                Text("Lesson Two - Pitch")
                    .fontWeight(.heavy).font(.largeTitle).foregroundColor(Color(hex:"#404654")).padding(70)
                    .offset(x: 0, y: -20)
                VStack {
                    Text("There have 7 difference pitches in the music.")
                        .font(.title)
                        .foregroundColor(Color(hex:"#404654"))
                        .padding()
                    
                    Text("They usaully in terms of C, D, E, F, G, A, B.")
                        .font(.title)
                        .foregroundColor(Color(hex:"#404654"))
                        .padding()
                    Text("They correspond to Do Re Mi Fa So La Si.")
                        .font(.title)
                        .foregroundColor(Color(hex:"#404654"))
                        .padding()
                    Text("There is one simple sample in the following.")
                        .font(.title)
                        .foregroundColor(Color(hex:"#404654"))
                        .padding()
                    Button(action:{
                        withAnimation {
                            alphaValue = 1
                        }
                    } , label: {
                        Text("Show").frame(width: 120, height: 40, alignment: .center).foregroundColor(.white).background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(hex: "FB93B2")))
                    })
                }.padding().offset(x: 0, y: -50)
                
                HStack {
                    ForEach(sod, id:\.name1) { s in
                        VStack {
                            ZStack {
                                Rectangle().fill(Color.white).frame(width: 90.0, height: 200.0).border(Color.black, width: 1)
                                Text(s.name1)
                                    .font(.title).foregroundColor(Color(hex:"#404654"))
                            }
                            Text(s.name2).font(.title).foregroundColor(Color(hex:"#404654"))
                        }
                    }
                }.opacity(self.alphaValue)
                
                Button(action: {
                    withAnimation {
                        alphaValue2 = 1
                    }
                    let url = URL(fileURLWithPath: path!)
                    do {
                        audioPlayer = try AVAudioPlayer(contentsOf: url)
                        audioPlayer?.play()}
                    
                    catch {
                        
                    }
                }, label:{
                    Text("Play")
                        .frame(width: 120, height: 40, alignment: .center).foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(hex: "FB93B2")))
                }).opacity(self.alphaValue).padding()
                
                NavigationLink {
                    LessonThreeView()
                    
                }label :{
                    Text("Next")
                        .frame(width: 120, height: 40, alignment: .center).foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(hex: "FB93B2")))
                    
                }.opacity(self.alphaValue2).padding().simultaneousGesture(TapGesture().onEnded{
                    let url = URL(fileURLWithPath: path!)
                    do {
                        audioPlayer = try AVAudioPlayer(contentsOf: url)
                        audioPlayer?.stop()}
                    
                    catch {
                        print("stop fail")
                    }
                })
            }.navigationBarBackButtonHidden(true)
        }
    }
}
