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
            AnchorScrollView {
                ScrollViewContent(title: "|Breakfast|") {
                    BreakfastItemList()
                }
                ScrollViewContent(title: "|Fast Food|") {
                    FastFoodItemList()
                }
                ScrollViewContent(title: "|Cheezy-Up! Pizza|") {
                    PizzaItemList()
                }
                ScrollViewContent(title: "|Waterloo Housemade Breakfast|") {
                    BreakfastItemList()
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
