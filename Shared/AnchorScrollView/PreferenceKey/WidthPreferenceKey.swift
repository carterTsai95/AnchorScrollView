//
//  WidthPreferenceKey.swift
//  AnchorScrollView
//
//  Created by Hung-Chun Tsai on 2022-09-18.
//

import SwiftUI

struct WidthPreferenceKey : PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}
