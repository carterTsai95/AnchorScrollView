//
//  FastFoodItemList.swift
//  AnchorScrollView
//
//  Created by Hung-Chun Tsai on 2022-09-19.
//

import SwiftUI

struct FastFoodItemList: View {
    var body: some View {
        VStack(spacing:0) {
            SectionTitleView(title: "Fast Food")

            ForEach(Food.getFastFoodItems()) { item in
                FoodItemRowView(
                    item.image,
                    title: item.title,
                    type: item.type
                )
            }
        }
    }
}

struct FastFoodItemList_Previews: PreviewProvider {
    static var previews: some View {
        FastFoodItemList()
    }
}
