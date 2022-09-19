//
//  ScrollViewContent.swift
//  AnchorScrollView
//
//  Created by Hung-Chun Tsai on 2022-09-18.
//

import SwiftUI

/*
 Create the simple ScrollViewContent which contains the title that will be use within the container. While using the result builder, we also add the constraint of view that user can actually use while access the AnchorScrollView
 */

struct ScrollViewContent<Content: View>: View {
    var title: String
    @ViewBuilder var content: Content
    
    var body: some View {
        content
    }
}
