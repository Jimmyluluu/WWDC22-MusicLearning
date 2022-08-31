//
//  File.swift
//  LearingMusic
//
//  Created by 魯敬元 on 2022/4/18.
//

import SwiftUI



struct StartView: View {
    var body: some View {
        ZStack{
            Color(hex:"#E1F7FF").edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Welcome")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    .foregroundColor(Color(hex:"#404654"))
                    .padding()
                    Image("Welcome").resizable().frame(width: 150, height: 150)
                }.offset(x: 50, y: 0).padding()
                Text("It is an app which you can learn music by sample piano.")
                    .font(.title)
                    .foregroundColor(Color(hex:"#404654"))
                Text("After four lessons, you can know basic music notations.").font(.title).foregroundColor(Color(hex:"#404654"))
                Text("Finally, you will have a challenge.").font(.title).foregroundColor(Color(hex:"#404654"))
                HStack(alignment: .center) {
                    Image("Guitar").resizable().frame(width: 500, height: 500, alignment: .leading)
                    
                    Image("Piano").resizable().frame(width: 300, height: 200, alignment: .leading).offset(x: -70, y:50)
                    
                    
                }
                .padding()
                NavigationLink {
                    LessonOneView()
                    
                }label :{
                    Text("Next")
                        .frame(width: 120, height: 40, alignment: .center).foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(hex: "FB93B2")))
                }.navigationBarBackButtonHidden(true)
                
            }.padding()
            
        }
    }
}
