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
        ZStack {
            Color("darkGray")
                .edgesIgnoringSafeArea(.all)
            if (isTunerMode) {
                VStack {
                    TunerModeView()
                    HStack {    // buttons
                        Button {
                            if (!isTunerMode) {
                                isTunerMode.toggle()
                            }
                        } label: {
                            TunerButton()
                        }
                            
                        Button {
                            if (isTunerMode) {
                                isTunerMode.toggle()
                            }
                        } label: {
                            InstrumentButton()
                        }
                    }
                }
                
            } else {
                VStack {
                    InstrumentModeView()
                    HStack {
                        Button {
                            if (!isTunerMode) {
                                isTunerMode.toggle()
                            }
                        } label: {
                            TunerButton()
                        }
                            
                        Button {
                            if (isTunerMode) {
                                isTunerMode.toggle()
                            }
                        } label: {
                            InstrumentButton()
                        }
                    }
                }
            }
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
        VStack{
            Text("Tuner Mode")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
            Spacer()
            // Placeholder Pitch value to be implemented
            Text("A")
                .font(.system(size: 100, weight: .bold))
                .foregroundColor(.white)
            // Placeholder Frequency value to be implemented
            Text("440Hz/440Hz")
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct InstrumentModeView: View {
    var body: some View {
        VStack{
            Text("Instrument Mode")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
            Spacer()
            // Placeholder Pitch value to be implemented
            Text("Not Implemented Yet")
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(.white)
            // Placeholder Frequency value to be implemented
            Text("LOL")
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct TunerButton: View {
    var body: some View {
            Image(systemName: "tuningfork")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .bold()
                .frame(width: 150, height: 30)
        .padding()
    }
}

struct InstrumentButton: View {
    var body: some View {
            Image(systemName: "music.note")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .bold()
                .frame(width: 150, height: 30)
        .padding()
    }
}
