import SwiftUI

import AVFoundation
import Foundation



struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex:"#E1F7FF").edgesIgnoringSafeArea(.all)
                List {
                    NavigationLink {
                        StartView()
                        
                    }label :{
                        Label("Home",  systemImage: "checkmark.seal")
                    }
                    NavigationLink {
                        LessonOneView()
                        
                    }label :{
                        Label("LessonOne", systemImage: "checkmark.seal")
                    }
                    
                    NavigationLink {
                        LessonTwoView()
                        
                    }label :{
                        Label("LessonTwo",  systemImage: "checkmark.seal")
                    }
                    NavigationLink {
                        LessonThreeView()
                        
                    }label :{
                        Label("LessonThree",  systemImage: "checkmark.seal")
                    }
                    NavigationLink {
                        LessonFourView()
                        
                    }label :{
                        Label("LessonFour",  systemImage: "checkmark.seal")
                    }
                    NavigationLink {
                        MusicView()
                        
                    }label :{
                        Label("Practice",  systemImage: "checkmark.seal")
                    }
                    NavigationLink {
                        ChallengeView()
                        
                    }label :{
                        Label("Challenge",  systemImage: "checkmark.seal")
                    }
                    
                }.navigationTitle("Lessson").navigationBarBackButtonHidden(true)
                
            }.navigationBarBackButtonHidden(true)
            StartView()
        }
    }
}
