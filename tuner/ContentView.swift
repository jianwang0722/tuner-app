//
//  ContentView.swift
//  tuner
//
//  Created by Jian Wang on 2023-07-20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isTunerMode = true
    
    var body: some View {
        if (isTunerMode) {
            TunerModeView()
        } else {
            InstrumentModeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TunerModeView: View {
    var body: some View {
        ZStack {
            Color("darkGray")
                .edgesIgnoringSafeArea(.all)
            
            // Buttons at the bottom of the screen
            VStack{
                Spacer()
                // Placeholder Pitch value to be implemented
                Text("A")
                    .font(.system(size: 100, weight: .bold))
                    .foregroundColor(.white)
                // Placeholder Frequency value to be implemented
                Text("440Hz")
                    .font(.system(size: 40, weight: .semibold))
                    .foregroundColor(.gray)
                Spacer()
                HStack {
                    TunerButton()
                    InstrumentButton()
                }
            }
        }
    }
}

struct InstrumentModeView: View {
    var body: some View {
        ZStack {
            Color("darkGray")
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Spacer()
                HStack {
                    TunerButton()
                    InstrumentButton()
                }
            }
        }
    }
}

struct TunerButton: View {
    var body: some View {
        Button {
            print("tapped")
        } label: {
            Image(systemName: "tuningfork")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .bold()
                .frame(width: 150, height: 30)
                
        }
        .padding()
    }
}

struct InstrumentButton: View {
    var body: some View {
        Button {
            print("tapped")
        } label: {
            Image(systemName: "music.note")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .bold()
                .frame(width: 150, height: 30)
        }
        .padding()
    }
}
