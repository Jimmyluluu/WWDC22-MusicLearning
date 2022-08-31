//
//  SwiftUIView.swift
//  LearingMusic
//
//  Created by 魯敬元 on 2022/4/24.
//

import SwiftUI
import AVFoundation
import Foundation



struct ChallengeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var alphaValue: Double = 0
    @State var alphaValue2: Double = 0
    @State var alphaValue3: Double = 1
    @State var alphaValue4: Double = 0
    
    @State private var showAlert = false
    
    @State var TextStart = "Start"
    @State var ImageText = "challenge"
    
    @State var click: [Int] = []
    
    @State var ans = [1, 1, 5, 5, 6, 6, 5, 4, 4, 3, 3, 2, 2, 1,
                      5, 5, 4, 4, 3, 3, 2, 5, 5, 4, 4, 3, 3, 2,
                      1, 1, 5, 5, 6, 6, 5, 4, 4, 3, 3, 2, 2, 1]
    
    @State var point: Int = 0
    
    @State var alertText: String = ""
    
    var body: some View {
        ZStack {
            Color(hex:"#E1F7FF").edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Text("Take on challenge!!!")
                        .font(.largeTitle).fontWeight(.heavy).foregroundColor(Color(hex:"#404654")).opacity(alphaValue3)
                        .offset(x: 0, y: -30)
                    Text("Let's play the Twinkle Twinkle Little Star by yourself.")
                        .font(.title).foregroundColor(Color(hex:"#404654"))
                        .offset(x: 0, y: -10).opacity(alphaValue3)
                    Image(ImageText).padding()
                    Text("Thank you, Have a nice day.")
                        .font(.title).foregroundColor(Color(hex:"#404654")).opacity(alphaValue4).padding()
                }.padding()
                HStack {
                    ForEach(sounds, id:\.self) { key in
                        let path = Bundle.main.path(forResource: key, ofType: "mp3")
                        let url = URL(fileURLWithPath: path!)
                        
                        Button {
                            do {
                                switch key {
                                case "C3":
                                    click.append(1)
                                case "D3":
                                    click.append(2)
                                case "E3":
                                    click.append(3)
                                case "F3":
                                    click.append(4)
                                case "G3":
                                    click.append(5)
                                case "A3":
                                    click.append(6)
                                case "B3":
                                    click.append(7)
                                case "C4":
                                    click.append(8)
                                default:
                                    break
                                    
                                }
                                
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
                }.padding().opacity(alphaValue)
                
                Button {
                    withAnimation {
                        if alphaValue == 1 {
                            alphaValue = 0
                            TextStart = "Start"
                            if click.count > 0 {
                                CheckPoint()
                            }
                            alphaValue2 = 1
                            showAlert = true
                            
                        }
                        else if alphaValue == 0 {
                            alphaValue = 1
                            TextStart = "Finish"
                            if click.count > 0 {
                                click.removeAll()
                            }
                            point = 0
                            
                        }
                    }
                    
                    if point == 42 {
                        alertText = "Wonderful, you finish all lesson and final challenge"
                    }
                    else {
                        alertText = "oops, you have \(42 - point) false, try again"
                    }
                } label: {
                    Text(TextStart).frame(width: 150, height: 40, alignment: .center).foregroundColor(.white).background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(hex: "FB93B2")))
                    
                }.padding().offset(x: 0, y: 15).alert(alertText, isPresented: $showAlert, actions: {
                    Button{
                        if point == 42 {
                            ImageText = "Congratulation"
                            alphaValue3 = 0
                            alphaValue4 = 1
                        }
                        else {
                            presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        Text("Ok")
                    }
                }).opacity(alphaValue3)
            }
            
        }.navigationBarBackButtonHidden(true)
    }
    func CheckPoint() {
        var j = 0
        for i in 0 ... click.count - 1 {
            if click[i] == ans[j] {
                point += 1
                j += 1
            }
            else {
                point -= 1
            }
            if j == 42 {
                break
            }
            
        }
    }
}
