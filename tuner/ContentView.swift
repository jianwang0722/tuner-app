//
//  ContentView.swift
//  tuner
//
//  Created by Jian Wang on 2023-07-20.
//

import SwiftUI
import Foundation
import Beethoven
import Pitchy

struct ContentView: View {
    
    @State private var isTunerMode = true
    @ObservedObject var viewModel: ViewModel    // init() to get around
    var pitchEngine: PitchEngine
    
    init(isTunerMode: Bool = true) {
        let localViewModel = ViewModel()
        self.isTunerMode = isTunerMode
        self.viewModel = localViewModel
        self.pitchEngine = {
            let config = Config(estimationStrategy: .yin)
            let pitchEngine = PitchEngine(config: config, delegate: localViewModel)
            pitchEngine.levelThreshold = -30.0
            return pitchEngine
        }()
        pitchEngine.start()
    }
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            if (isTunerMode) {
                VStack {
                    // tuner mode
                    TunerModeView(viewModel: viewModel)
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
                
            } else {    // instrument mode
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
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack{
            Text("Tuner Mode")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.blue)
            Spacer()
            // Placeholder Pitch value to be implemented
            Text(viewModel.noteText)
                .font(.system(size: 100, weight: .bold))
                .foregroundColor(.blue)
            // Placeholder Frequency value to be implemented
            Text(viewModel.offsetText)
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

class ViewModel: ObservableObject {
    @Published var noteText: String
    @Published var offsetText: String
    // make init method with recieved pitch??
    init(noteText: String = "--", offsetText: String = "+0.0%") {
        self.noteText = noteText
        self.offsetText = offsetText
    }
}

extension ViewModel: PitchEngineDelegate {
    
    func pitchEngine(_ pitchEngine: PitchEngine, didReceivePitch pitch: Pitch) {
        //ViewModel(noteText:pitch.note.string, offsetText: String(format:"%.2f", pitch.closestOffset.percentage) + "%")
        
        self.noteText = pitch.note.string
        self.offsetText = String(format:"%.2f", pitch.closestOffset.percentage) + "%"
        print("recieving pitch")
    }
    func pitchEngine(_ pitchEngine: PitchEngine, didReceiveError error: Error) {
        print(error)
    }
    func pitchEngineWentBelowLevelThreshold(_ pitchEngine: PitchEngine) {
        print("Below level threshold")
    }

}
