//
//  Food.swift
//  AnchorScrollView
//
//  Created by Hung-Chun Tsai on 2022-09-19.
//

import SwiftUI

struct Food: Identifiable {
    var id = UUID()
    var image: Image
    var title: String
    var type: String
}

extension Food {
    static func getBreakfastItems() -> [Food] {
        [
            Food(image: .init("breakfast_1"), title: "1st Breakfast Item", type: "Breakfast"),
            Food(image: .init("breakfast_2"), title: "2nd Breakfast Item", type: "Breakfast"),
            Food(image: .init("breakfast_3"), title: "3rd Breakfast Item", type: "Breakfast"),
            Food(image: .init("breakfast_2"), title: "4th Breakfast Item", type: "Breakfast"),
            Food(image: .init("breakfast_1"), title: "5th Breakfast Item", type: "Breakfast"),
            Food(image: .init("breakfast_3"), title: "6th Breakfast Item", type: "Breakfast"),
            Food(image: .init("breakfast_2"), title: "7th Breakfast Item", type: "Breakfast"),
            Food(image: .init("breakfast_1"), title: "8th Breakfast Item", type: "Breakfast")
        ]
    }

    static func getFastFoodItems() -> [Food] {
        [
            Food(image: .init("fastfood_1"), title: "Chicken Combo", type: "Fast Food"),
            Food(image: .init("fastfood_2"), title: "Biscuits(3 Pieces)", type: "Fast Food"),
            Food(image: .init("fastfood_3"), title: "Fried Chicken", type: "Fast Food"),
            Food(image: .init("fastfood_4"), title: "Jalapeno Bombers (16 Pieces)", type: "Fast Food"),
            Food(image: .init("fastfood_5"), title: "5 Chicken Tenders Combo", type: "Fast Food"),
            Food(image: .init("fastfood_4"), title: "Fried Chicken", type: "Fast Food"),
            Food(image: .init("fastfood_3"), title: "Fried Chicken", type: "Fast Food"),
            Food(image: .init("fastfood_2"), title: "Biscuits(3 Pieces)", type: "Fast Food"),
            Food(image: .init("fastfood_1"), title: "Chicken Combo-2", type: "Fast Food")
        ]
    }

    static func getPizzaItems() -> [Food] {
        [
            Food(image: .init("pizza_1"), title: "Cheezy-Bread", type: "Pizza"),
            Food(image: .init("pizza_2"), title: "Bruschetta Bread", type: "Pizza"),
            Food(image: .init("pizza_3"), title: "Cinnamon Breadsticks", type: "Pizza"),
            Food(image: .init("pizza_4"), title: "Veggie Suprme", type: "Pizza"),
            Food(image: .init("pizza_5"), title: "Canadian (Medium)", type: "Fast Food"),
            Food(image: .init("pizza_6"), title: "Chicken Pesto", type: "Pizza"),
            Food(image: .init("pizza_7"), title: "Hearty Veggie Pasta", type: "Pizza"),
            Food(image: .init("pizza_5"), title: "Canadian (Small)", type: "Pizza"),
            Food(image: .init("pizza_3"), title: "Cinnamon Breadsticks", type: "Pizza")
        ]
    }
}
