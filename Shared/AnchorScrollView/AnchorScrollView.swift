//
//  AnchorScrollView.swift
//  AnchorScrollView
//
//  Created by Hung-Chun Tsai on 2022-09-18.
//

import SwiftUI

/*
 The interface that provide to the developer to use.
 */

struct AnchorScrollView<Content: View>: View {
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
