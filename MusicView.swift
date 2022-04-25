//
//  File.swift
//  LearingMusic
//
//  Created by 魯敬元 on 2022/4/18.
//

import SwiftUI

import AVFoundation
import Foundation

let sounds = ["C3", "D3", "E3", "F3", "G3", "A3", "B3", "C4"]

var audioPlayer: AVAudioPlayer?
let player = AVPlayer()


struct MusicView: View {
    @State var alphaValue: Double = 0
    @State var alphaValue2: Double = 1
    @State var TextHide = "Hide Musical Notation"
    @State var TextPractice = "Begin Practice"
    
    
    var body: some View {
        ZStack {
            Color(hex:"#E1F7FF").edgesIgnoringSafeArea(.all)
            VStack{
                Text("LessonFive - Practice")
                    .font(.largeTitle).fontWeight(.heavy).foregroundColor(Color(hex:"#404654")).offset(x: 0, y: -50).padding()
                
                
                Image("TwinkleTwinkleLittleStar").resizable().padding(20).frame(width: 750, height: 350, alignment: .center).opacity(alphaValue2)
                
                Button(action:{
                    withAnimation {
                        if alphaValue2 == 1 {
                            alphaValue2 = 0
                            TextHide = "Show Musical Notation"
                        }
                        else if alphaValue2 == 0 {
                            alphaValue2 = 1
                            TextHide = "Hide Musical Notation"
                        }
                        
                    }
                } , label: {
                    Text(TextHide).frame(width: 220, height: 40, alignment: .center).foregroundColor(.white).background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(hex: "FB93B2")))
                    
                })
                
                HStack {
                    ForEach(sounds, id:\.self) { key in
                        let path = Bundle.main.path(forResource: key, ofType: "mp3")
                        let url = URL(fileURLWithPath: path!)
                        
                        Button {
                            do {
                                audioPlayer = try AVAudioPlayer(contentsOf: url)
                                audioPlayer?.play()
                                
                            }
                            catch {
                                
                            }
                        }label:{
                            ZStack {
                                Rectangle().fill(Color.white).frame(width: 90.0, height: 200.0).border(Color.black, width: 1)
                                Text(key)
                                
                            }
                        }
                        
                    }
                }.padding()
                
 
                VStack {
                    Text("If you are already, click \"Challenge\" you can start to challenge").font(.title).foregroundColor(Color(hex:"#404654"))
                    NavigationLink {
                        ChallengeView()
                    }label :{
                        Text("Challenge")
                            .frame(width: 120, height: 40, alignment: .center).foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(hex: "FB93B2")))
                        
                    }.padding()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

