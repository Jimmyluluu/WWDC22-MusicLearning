//
//  File.swift
//  LearingMusic
//
//  Created by 魯敬元 on 2022/4/18.
//

import SwiftUI
import AVFoundation
import Foundation




struct LessonOneView: View {
    @State var alphaValue: Double = 0
    
    var body: some View {
        
        ZStack {
            Color(hex:"#E1F7FF").edgesIgnoringSafeArea(.all)
            VStack {
               
                    Text("Lesson One - Musical Notation").fontWeight(.heavy)
                        .font(.largeTitle).foregroundColor(Color(hex:"#404654")).padding()
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("This is a treble quarter note.").font(.title).foregroundColor(Color(hex:"#404654"))
                            Text("It is usually as one time in a song.")
                                .font(.title).foregroundColor(Color(hex:"#404654"))
                        }
                        
                        Image("Note")
                            .resizable().frame(width: 100, height: 100, alignment: .center).padding()
                    }
                    HStack {
                        VStack(alignment: .leading) {
                            Text("This is a treble half note.").font(.title).foregroundColor(Color(hex:"#404654"))
                            Text("It is usually as two times in a song.")
                                .font(.title).foregroundColor(Color(hex:"#404654"))
                        }
                        
                        Image("Note2")
                            .resizable().frame(width: 50, height: 100, alignment: .center).padding()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("This is a sheet music has five line and clef.")
                                .font(.title).foregroundColor(Color(hex:"#404654"))
                            Text("The staff is strewn with notes.").font(.title)     .foregroundColor(Color(hex:"#404654"))                   }
                        Image("Staff").resizable().frame(width: 200, height: 100).padding()
                        
                    }
                }
                
                
                Text("We can see symbols on the staff.").font(.title).foregroundColor(Color(hex:"#404654"))      
                    .padding(10)
                    .offset(x: 0, y: -5)
                Button(action:{
                    withAnimation {
                        alphaValue = 1
                    }
                } , label: {
                    Text("Combine").frame(width: 120, height: 40, alignment: .center).foregroundColor(.white).background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(hex: "FB93B2")))
                        .offset(x: 0, y: 15)
                    
                })
                
                Image("Combine").opacity(self.alphaValue)
                    .offset(x: 0, y: 40)
                
                
                NavigationLink {
                    LessonTwoView()
                    
                }label :{
                    Text("Next")
                        .frame(width: 120, height: 40, alignment: .center).foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(hex: "FB93B2")))
                    
                }.opacity(self.alphaValue).navigationBarBackButtonHidden(true)
                    .offset(x: 0, y: 40)
                
            }.offset(x: 0, y: -100).padding()
        }
    }
}
