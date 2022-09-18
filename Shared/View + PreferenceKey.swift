//
//  View + PreferenceKey.swift
//  AnchorScrollView
//
//  Created by Hung-Chun Tsai on 2022-09-18.
//

import SwiftUI

struct ViewOffsetsKey: PreferenceKey {
    static var defaultValue: [Int: CGFloat] = [:]
    static func reduce(value: inout [Int: CGFloat], nextValue: () -> [Int: CGFloat]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

struct WidthPreferenceKey : PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
    
}

extension View {
    func getWidth(perform action: @escaping (CGFloat) -> Void) -> some View {
        self
            .background(GeometryReader {
                Color.clear.preference(key: WidthPreferenceKey.self, value: $0.size.width)
            })
            .onPreferenceChange(WidthPreferenceKey.self) { width in
                action(width)
            }
    }
}
