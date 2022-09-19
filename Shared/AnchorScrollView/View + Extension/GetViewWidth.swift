//
//  GetViewWidth.swift
//  AnchorScrollView
//
//  Created by Hung-Chun Tsai on 2022-09-18.
//

import SwiftUI

extension View {
    func getWidth(
        perform action: @escaping (CGFloat) -> Void
    ) -> some View {
        self
            .background(GeometryReader {
                Color.clear.preference(key: WidthPreferenceKey.self, value: $0.size.width)
            })
            .onPreferenceChange(WidthPreferenceKey.self) { width in
                action(width)
            }
    }
}
