//
//  PizzaItemList.swift
//  AnchorScrollView
//
//  Created by Hung-Chun Tsai on 2022-09-19.
//

import SwiftUI

struct PizzaItemList: View {
    var body: some View {
        VStack(spacing:0) {
            SectionTitleView(title: "Cheezy-up! Pizza")

            ForEach(Food.getPizzaItems()) { item in
                FoodItemRowView(
                    item.image,
                    title: item.title,
                    type: item.type
                )
            }
        }
    }
}

struct PizzaItemList_Previews: PreviewProvider {
    static var previews: some View {
        PizzaItemList()
    }
}
