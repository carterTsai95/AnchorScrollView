//
//  BreakfastItemList.swift
//  AnchorScrollView
//
//  Created by Hung-Chun Tsai on 2022-09-19.
//

import SwiftUI

struct BreakfastItemList: View {
    var body: some View {
        VStack(spacing:0) {
            SectionTitleView(title: "Breakfast")

            ForEach(Food.getBreakfastItems()) { item in
                FoodItemRowView(
                    item.image,
                    title: item.title,
                    type: item.type
                )
            }
        }
    }
}

struct SectionTitleView: View {
    let title: String
    var body: some View {
        VStack(spacing:0) {
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.light)
                    .padding(.horizontal)
                    .padding(.top, 10)
                Spacer()
            }
            Divider()
                .padding(.horizontal)
        }
    }
}


struct BreakfastItemList_Previews: PreviewProvider {
    static var previews: some View {
        BreakfastItemList()
    }
}
