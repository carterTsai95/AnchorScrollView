//
//  FoodItemRowView.swift
//  AnchorScrollView
//
//  Created by Hung-Chun Tsai on 2022-09-19.
//

import SwiftUI

struct FoodItemRowView: View {
    let image: Image
    let title: String
    let type: String

    init(
        _ image: Image,
        title: String,
        type: String
    ){
        self.image = image
        self.title = title
        self.type = type
    }

    var body: some View {
        HStack {
            image
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(1, contentMode: .fill)
                .padding(.trailing, 4)
            
            VStack (alignment: .leading, spacing: 4) {
                HStack {
                    Text(type)
                        .font(.caption2)
                    Spacer()
                    
                    Image("like")
                }
                Text(title)
                    .fontWeight(.medium)
                
                HStack (spacing: 2) {
                    ForEach(0 ..< 5) { item in
                        Image("star")
                            .renderingMode(.template)
                            .foregroundColor(Color("PrimaryColor"))
                    }
                    
                    Text("120 Calories")
                        .font(.caption)
                        .foregroundColor(Color("PrimaryColor"))
                        .padding(.leading)
                }
                
                HStack {
                    Image("time")
                    Text("10 mins")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    
                    
                    Image("serving")
                        .padding(.leading)
                    Text("1 Serving")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    
                }
            }
            .frame(maxWidth: .infinity)
            
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}



struct FoodItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemRowView(Image("breakfast_1"), title: "Test", type: "Food_Type")
    }
}
