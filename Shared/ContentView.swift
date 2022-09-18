//
//  ContentView.swift
//  Shared
//
//  Created by Hung-Chun Tsai on 2022-09-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            AnchorScrollViewContainer {
                ScrollViewContent(title: "|First Long Title|") {
                    Color.blue
                        .frame(height: 1200)
                        .overlay(Text("1st Content"))
                }
                ScrollViewContent(title: "|Shorter|") {
                    Color.orange
                        .frame(height: 1200)
                        .overlay(Text("2nd Content"))
                }
                ScrollViewContent(title: "|Third Long Title - Test Long Title|") {
                    Color.brown
                        .frame(height: 1200)
                        .overlay(Text("3rd Content"))
                }
                ScrollViewContent(title: "|Fourth Title - Title|") {
                    Color.indigo
                        .frame(height: 1200)
                        .overlay(Text("4th Content"))
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
