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
        ScrollViewContainerBuilder<
            C1, C2, EmptyView, EmptyView, EmptyView, EmptyView, EmptyView, EmptyView, EmptyView
        >(
            c1: c1, c2: c2
        )
    }
    
    static func buildBlock<C1: View, C2: View, C3: View>(
        _ c1: ScrollViewContent<C1>,
        _ c2: ScrollViewContent<C2>,
        _ c3: ScrollViewContent<C3>
    ) -> some View {
        ScrollViewContainerBuilder<
            C1, C2, C3, EmptyView, EmptyView, EmptyView, EmptyView, EmptyView, EmptyView
        >(
            c1: c1, c2: c2, c3: c3
        )
    }
    
    static func buildBlock<C1: View, C2: View, C3: View, C4: View>(
        _ c1: ScrollViewContent<C1>,
        _ c2: ScrollViewContent<C2>,
        _ c3: ScrollViewContent<C3>,
        _ c4: ScrollViewContent<C4>
    ) -> some View {
        ScrollViewContainerBuilder<
            C1, C2, C3, C4, EmptyView, EmptyView, EmptyView, EmptyView, EmptyView
        >(
            c1: c1, c2: c2, c3: c3, c4: c4
        )
    }

    static func buildBlock<C1: View, C2: View, C3: View, C4: View, C5: View>(
        _ c1: ScrollViewContent<C1>,
        _ c2: ScrollViewContent<C2>,
        _ c3: ScrollViewContent<C3>,
        _ c4: ScrollViewContent<C4>,
        _ c5: ScrollViewContent<C5>
    ) -> some View {
        ScrollViewContainerBuilder<
            C1, C2, C3, C4, C5, EmptyView, EmptyView, EmptyView, EmptyView
        >(
            c1: c1, c2: c2, c3: c3, c4: c4, c5: c5
        )
    }

    static func buildBlock<C1: View, C2: View, C3: View, C4: View, C5: View, C6: View>(
        _ c1: ScrollViewContent<C1>,
        _ c2: ScrollViewContent<C2>,
        _ c3: ScrollViewContent<C3>,
        _ c4: ScrollViewContent<C4>,
        _ c5: ScrollViewContent<C5>,
        _ c6: ScrollViewContent<C6>
    ) -> some View {
        ScrollViewContainerBuilder<
            C1, C2, C3, C4, C5, C6, EmptyView, EmptyView, EmptyView
        >(
            c1: c1, c2: c2, c3: c3, c4: c4, c5: c5, c6: c6
        )
    }

    static func buildBlock<C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View>(
        _ c1: ScrollViewContent<C1>,
        _ c2: ScrollViewContent<C2>,
        _ c3: ScrollViewContent<C3>,
        _ c4: ScrollViewContent<C4>,
        _ c5: ScrollViewContent<C5>,
        _ c6: ScrollViewContent<C6>,
        _ c7: ScrollViewContent<C7>
    ) -> some View {
        ScrollViewContainerBuilder<
            C1, C2, C3, C4, C5, C6, C7, EmptyView, EmptyView
        >(
            c1: c1, c2: c2, c3: c3, c4: c4, c5: c5, c6: c6, c7: c7
        )
    }

    static func buildBlock<C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View>(
        _ c1: ScrollViewContent<C1>,
        _ c2: ScrollViewContent<C2>,
        _ c3: ScrollViewContent<C3>,
        _ c4: ScrollViewContent<C4>,
        _ c5: ScrollViewContent<C5>,
        _ c6: ScrollViewContent<C6>,
        _ c7: ScrollViewContent<C7>,
        _ c8: ScrollViewContent<C8>
    ) -> some View {
        ScrollViewContainerBuilder<
            C1, C2, C3, C4, C5, C6, C7, C8, EmptyView
        >(
            c1: c1, c2: c2, c3: c3, c4: c4, c5: c5, c6: c6, c7: c7, c8: c8
        )
    }

    static func buildBlock<C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View>(
        _ c1: ScrollViewContent<C1>,
        _ c2: ScrollViewContent<C2>,
        _ c3: ScrollViewContent<C3>,
        _ c4: ScrollViewContent<C4>,
        _ c5: ScrollViewContent<C5>,
        _ c6: ScrollViewContent<C6>,
        _ c7: ScrollViewContent<C7>,
        _ c8: ScrollViewContent<C8>,
        _ c9: ScrollViewContent<C9>
    ) -> some View {
        ScrollViewContainerBuilder<
            C1, C2, C3, C4, C5, C6, C7, C8, C9
        >(
            c1: c1, c2: c2, c3: c3, c4: c4, c5: c5, c6: c6, c7: c7, c8: c8, c9: c9
        )
    }
}
