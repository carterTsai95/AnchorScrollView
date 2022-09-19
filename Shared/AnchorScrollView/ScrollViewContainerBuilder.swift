//
//  ScrollViewContainerBuilder.swift
//  AnchorScrollView
//
//  Created by Hung-Chun Tsai on 2022-09-18.
//

import SwiftUI
import Combine

struct ScrollViewContainerBuilder<C1: View, C2: View, C3: View, C4: View>: View {
    var c1: ScrollViewContent<C1>
    var c2: ScrollViewContent<C2>?
    var c3: ScrollViewContent<C3>?
    var c4: ScrollViewContent<C4>?
    @State private var scrollAnchor = CurrentValueSubject<Int, Never>(1)
    @State private var offsets: [Int: CGFloat] = [:]
    
    private var currentSelectedItemNumber: Int {
        return offsets.min {
            abs($0.1) <= abs($1.1)
        }?.key ?? 1
    }
    
    private var horizontalBarSelectedItemOffset: CGFloat {
        let barItemWidth = horizantalBarItemWidth.filter({ $0.key < currentSelectedItemNumber })
        var totalXaxisOffset: CGFloat = 0
        for barItemWidth in barItemWidth {
            totalXaxisOffset += barItemWidth.value
        }
        return totalXaxisOffset
    }
    
    private var selectedHorizontalItemWidth: CGFloat? {
        horizantalBarItemWidth[currentSelectedItemNumber]
    }
    
    @State private var horizantalBarItemWidth: [Int: CGFloat] = [:]
    
    
    init(
        c1: ScrollViewContent<C1>,
        c2: ScrollViewContent<C2>?,
        c3: ScrollViewContent<C3>?,
        c4: ScrollViewContent<C4>?
    ) {
        self.c1 = c1
        self.c2 = c2
        self.c3 = c3
        self.c4 = c4
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { value in
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack(spacing: 3) {
                        HStack(spacing: 2) {
                            Button {
                                scrollAnchor.send(1)
                            } label: {
                                Text(c1.title)
                                    .fontWeight(isSelected(1) ? .bold : .regular)
                            }
                            .id(1)
                            .padding(.horizontal, 5)
                            .getWidth { width in
                                horizantalBarItemWidth[1] = width
                            }
                            
                            if let c2 = c2 {
                                Button {
                                    scrollAnchor.send(2)
                                } label: {
                                    Text(c2.title)
                                        .fontWeight(isSelected(2) ? .bold : .regular)
                                }
                                .id(2)
                                .padding(.horizontal, 5)
                                .getWidth { width in
                                    horizantalBarItemWidth[2] = width
                                }
                            }
                            
                            if let c3 = c3 {
                                Button {
                                    scrollAnchor.send(3)
                                } label: {
                                    Text(c3.title)
                                        .fontWeight(isSelected(3) ? .bold : .regular)
                                }
                                .id(3)
                                .padding(.horizontal, 5)
                                .getWidth { width in
                                    horizantalBarItemWidth[3] = width
                                }
                            }
                            
                            if let c4 = c4 {
                                Button {
                                    scrollAnchor.send(4)
                                } label: {
                                    Text(c4.title)
                                        .fontWeight(isSelected(4) ? .bold : .regular)
                                }
                                .id(4)
                                .padding(.horizontal, 5)
                                .getWidth { width in
                                    horizantalBarItemWidth[4] = width
                                }
                            }
                        }
                        .fixedSize(horizontal: false, vertical: false)
                        .foregroundColor(.black)
                        ZStack {
                            HStack(spacing: 0) {
                                Rectangle()
                                    .cornerRadius(30)
                                    .foregroundColor(.pink)
                                    .frame(width: selectedHorizontalItemWidth, height: 3.0)
                                    .offset(x: horizontalBarSelectedItemOffset)
                                    .animation(.linear)
                                Spacer()
                            }
                        }
                    }
                }
                .onChange(of: currentSelectedItemNumber) { newValue in
                    withAnimation {
                        value.scrollTo(newValue, anchor: .leading)
                    }
                }
            }
            
            ScrollViewReader { value in
                ScrollView {
                    LazyVStack(spacing: 0) {
                        c1.content
                            .id(1)
                            .background(
                                GeometryReader { geo in
                                    Color.clear.preference(
                                        key: ViewOffsetsKey.self,
                                        value: [1 : geo.frame(in: .named("scrollView")).origin.y]) }
                            )
                        
                        if let c2 = c2 {
                            c2.content
                                .id(2)
                                .background(
                                    GeometryReader { geo in
                                        Color.clear.preference(
                                            key: ViewOffsetsKey.self,
                                            value: [2 : geo.frame(in: .named("scrollView")).origin.y])
                                    }
                                )
                        }
                        
                        if let c3 = c3 {
                            c3.content
                                .id(3)
                                .background(
                                    GeometryReader { geo in
                                        Color.clear.preference(
                                            key: ViewOffsetsKey.self,
                                            value: [3 : geo.frame(in: .named("scrollView")).origin.y])
                                    }
                                )
                        }
                        
                        if let c4 = c4 {
                            c4.content
                                .id(4)
                                .background(
                                    GeometryReader { geo in
                                        Color.clear.preference(
                                            key: ViewOffsetsKey.self,
                                            value: [4 : geo.frame(in: .named("scrollView")).origin.y])
                                    }
                                )
                        }
                    }
                    .onPreferenceChange(ViewOffsetsKey.self, perform: { keyWithOffset in
                        let filteredOffset = keyWithOffset.filter {
                            return abs($1) >= 0
                        }
                        DispatchQueue.main.async {
                            for pref in filteredOffset { offsets[pref.key] = pref.value }
                        }
                    })
                    
                }
                .coordinateSpace(name: "scrollView")
                .onReceive(scrollAnchor, perform: { newValue in
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        withAnimation {
                            value.scrollTo(newValue, anchor: .top)
                        }
                    }
                })
            }
        }
    }
}

extension ScrollViewContainerBuilder {
    func isSelected(_ id: Int) -> Bool {
        return id == currentSelectedItemNumber
    }
}

extension ScrollViewContainerBuilder where C3 == EmptyView{
    init(c1: ScrollViewContent<C1>, c2: ScrollViewContent<C2>?) {
        self.c1 = c1
        self.c2 = c2
        self.c3 = nil
    }
}

extension ScrollViewContainerBuilder where C4 == EmptyView {
    init(c1: ScrollViewContent<C1>, c2: ScrollViewContent<C2>?, c3: ScrollViewContent<C3>?) {
        self.c1 = c1
        self.c2 = c2
        self.c3 = c3
        self.c4 = nil
    }
}
