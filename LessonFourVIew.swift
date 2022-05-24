//
//  File.swift
//  LearingMusic
//
//  Created by 魯敬元 on 2022/4/19.
//

import SwiftUI
import AVFoundation
import Foundation


struct LittleS {
    let note: String
    let duration: Double
}


struct LessonFourView: View {
    
    @State var alphaValue: Double = 0
    @State var Stop = true
    @State var Play = "Play"
    
    var body: some View {
        ZStack {
            Color(hex:"#E1F7FF").edgesIgnoringSafeArea(.all)
            VStack {
                VStack{
                Text("Lesson Four - Twinkle Twinkle Little Star")
                        .font(.largeTitle).fontWeight(.heavy).foregroundColor(Color(hex:"#404654")).offset(x: 0, y: -60)
                Text("Finally, we can try to play the classic nursery rhyme.").foregroundColor(Color(hex:"#404654")).font(.title)

                Text("The following is its sheet music, and it will show how to play.").foregroundColor(Color(hex:"#404654")).font(.title)
                
               
                    Image("TwinkleTwinkleLittleStar").resizable().padding(20).frame(width: 750, height: 350, alignment: .center).offset(x: 50, y: 0)
                }.padding().offset(x: 0, y: -80)
                
                Button {
                    withAnimation {
                        alphaValue = 1
                    }
                    
                    let path = Bundle.main.path(forResource: "Little", ofType: "mp3")
                    let url = URL(fileURLWithPath: path!)
                    
                    
                    if Stop == false{
                        Play = "Play"
                        do {
                            audioPlayer = try AVAudioPlayer(contentsOf: url)
                            audioPlayer?.stop()}
                        
                        catch {
                            
                        }
                        Stop = true
                    }
                    else {
                        Play = "Stop"
                        do {
                            audioPlayer = try AVAudioPlayer(contentsOf: url)
                            audioPlayer?.play()}
                        
                        catch {
                            
                        }
                        Stop = false
                    }

                    
                } label:{
                    Text(Play)
                        .frame(width: 120, height: 40, alignment: .center).foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(hex: "FB93B2")))
                }
     
                
                
                NavigationLink {
                    MusicView()
                }label :{
                    Text("Try")
                        .frame(width: 120, height: 40, alignment: .center).foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(hex: "FB93B2")))
                    
                    
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).navigationBarBackButtonHidden(true).opacity(alphaValue)
            }
        }
    }
    
}
