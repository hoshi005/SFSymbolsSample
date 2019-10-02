//
//  ContentView.swift
//  SFSymbolsSample
//
//  Created by Susumu Hoshikawa on 2019/10/02.
//  Copyright © 2019 SH Lab, Inc. All rights reserved.
//

import SwiftUI

/// セグメントの画像名を適当に.
let imageNames = [
    "bookmark",
    "play.circle",
    "goforward.60",
    "music.mic"
]

struct ContentView: View {
    
    /// セグメントの初期値.
    @State var selected = imageNames[0]
    
    var body: some View {
        NavigationView {
            List {
                // セグメントコントロール.
                Picker("Pickerだよ", selection: $selected) {
                    ForEach(imageNames, id: \.self) { imageName in
                        Image(systemName: imageName)
                            .imageScale(.medium)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                // セルを適当に.
                Cell(imageName: "sun.max.fill", weather: "はれ")
                Cell(imageName: "cloud", color: .gray, weather: "くもり")
                Cell(imageName: "wind", color: .blue, weather: "台風")
                Cell(imageName: "cloud.bolt", weather: "かみなり")
                Cell(imageName: "cloud.snow", color: .black, weather: "雪")
            }
            .navigationBarTitle("てんき", displayMode: .inline)
        }
    }
}

struct Cell: View {
    
    var imageName: String
    var color: Color = .yellow
    var weather: String
    
    var body: some View {
        HStack(spacing: 16.0) {
            Image(systemName: imageName)
                .imageScale(.large)
                .foregroundColor(color)
            Text(weather)
                .font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
