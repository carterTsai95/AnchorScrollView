//
//  AnchorScrollViewContainerBuilder.swift
//  AnchorScrollView
//
//  Created by Hung-Chun Tsai on 2022-09-18.
//

import SwiftUI

@resultBuilder
struct AnchorScrollViewContainerBuilder {
    static func buildBlock<C0: View, C1: View>(
        _ c0: ScrollViewContent<C0>,
        _ c1: ScrollViewContent<C1>
    ) -> some View {
        ScrollViewContainerBuilder<C0, C1, EmptyView, EmptyView>(p1: c0, p2: c1)
    }
    
    static func buildBlock<C0: View, C1: View, C2: View>(
        _ c0: ScrollViewContent<C0>,
        _ c1: ScrollViewContent<C1>,
        _ c2: ScrollViewContent<C2>
    ) -> some View {
        ScrollViewContainerBuilder<C0, C1, C2, EmptyView>(p1: c0, p2: c1, p3: c2)
    }
    
    static func buildBlock<C0: View, C1: View, C2: View, C3: View>(
        _ c0: ScrollViewContent<C0>,
        _ c1: ScrollViewContent<C1>,
        _ c2: ScrollViewContent<C2>,
        _ c3: ScrollViewContent<C3>
    ) -> some View {
        ScrollViewContainerBuilder<C0, C1, C2, C3>(p1: c0, p2: c1, p3: c2, p4: c3)
    }
}

struct ScrollViewContent<Content: View>: View {
    var title: String
    @ViewBuilder var content: Content
    
    var body: some View {
        content
    }
}

struct AnchorScrollViewContainer<Content: View>: View {
    @AnchorScrollViewContainerBuilder private var content: () -> Content

    init (
        @AnchorScrollViewContainerBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }
    
    var body: some View {
        content()
    }
}
