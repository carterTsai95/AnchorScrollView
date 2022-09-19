//
//  AnchorScrollViewContainerBuilder.swift
//  AnchorScrollView
//
//  Created by Hung-Chun Tsai on 2022-09-18.
//

import SwiftUI

@resultBuilder
struct AnchorScrollViewContainerBuilder {
    static func buildBlock<C1: View, C2: View>(
        _ c1: ScrollViewContent<C1>,
        _ c2: ScrollViewContent<C2>
    ) -> some View {
        ScrollViewContainerBuilder<C1, C2, EmptyView, EmptyView>(c1: c1, c2: c2)
    }
    
    static func buildBlock<C1: View, C2: View, C3: View>(
        _ c1: ScrollViewContent<C1>,
        _ c2: ScrollViewContent<C2>,
        _ c3: ScrollViewContent<C3>
    ) -> some View {
        ScrollViewContainerBuilder<C1, C2, C3, EmptyView>(c1: c1, c2: c2, c3: c3)
    }
    
    static func buildBlock<C1: View, C2: View, C3: View, C4: View>(
        _ c1: ScrollViewContent<C1>,
        _ c2: ScrollViewContent<C2>,
        _ c3: ScrollViewContent<C3>,
        _ c4: ScrollViewContent<C4>
    ) -> some View {
        ScrollViewContainerBuilder<C1, C2, C3, C4>(c1: c1, c2: c2, c3: c3, c4: c4)
    }

    // TODO: Adding the remaining cases to make the AnchorScrollView to support 10 content maxiumum.
}
