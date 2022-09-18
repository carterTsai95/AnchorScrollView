//
//  ScrollViewContainerBuilder.swift
//  AnchorScrollView
//
//  Created by Hung-Chun Tsai on 2022-09-18.
//

import SwiftUI
import Combine

struct ScrollViewContainerBuilder<P1: View, P2: View, P3: View, P4: View>: View {
    var p1: ScrollViewContent<P1>
    var p2: ScrollViewContent<P2>?
    var p3: ScrollViewContent<P3>?
    var p4: ScrollViewContent<P4>?
    @State private var scrollAnchor = CurrentValueSubject<Int, Never>(1)
    @State private var offsets: [Int: CGFloat] = [:]
    
    private var currentItemNo: Int {
        offsets.min { abs($0.1) <= abs($1.1) }?.key ?? 1
    }
    
    private var barOffset: CGFloat {
        let barItemWidth = horizantalBarItemWidth.filter({ $0.key < currentItemNo })
        var tempOffset: CGFloat = 0
        for barItemWidth in barItemWidth {
            tempOffset += barItemWidth.value
        }
        return tempOffset
    }
    
    private var barWidth: CGFloat? {
        horizantalBarItemWidth[currentItemNo]
    }
    @State private var horizantalBarItemWidth: [Int: CGFloat] = [:]
    
    
    init(
        p1: ScrollViewContent<P1>,
        p2: ScrollViewContent<P2>?,
        p3: ScrollViewContent<P3>?,
        p4: ScrollViewContent<P4>?
    ) {
        self.p1 = p1
        self.p2 = p2
        self.p3 = p3
        self.p4 = p4
    }
    
    var body: some View {
        VStack(spacing: 0) {
//            HStack {
//                Text("Current item no: \(currentItemNo)")
//                    .padding(5)
//                    .background(Color.white)
//                Spacer()
//            }
            ScrollViewReader { value in
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack(spacing: 3) {
                        HStack(spacing: 0) {
                            Button {
                                scrollAnchor.send(1)
                            } label: {
                                Text(p1.title)
                            }.id(1)
                                .padding(.horizontal, 5)
                                .getWidth { width in
                                    horizantalBarItemWidth[1] = width
                                }
                            
                            if let p2 = p2 {
                                Button {
                                    scrollAnchor.send(2)
                                } label: {
                                    Text(p2.title)
                                }
                                .id(2)
                                .padding(.horizontal, 5)
                                .getWidth { width in
                                    horizantalBarItemWidth[2] = width
                                }
                            }
                            
                            if let p3 = p3 {
                                Button {
                                    scrollAnchor.send(3)
                                } label: {
                                    Text(p3.title)
                                }
                                .id(3)
                                .padding(.horizontal, 5)
                                .getWidth { width in
                                    horizantalBarItemWidth[3] = width
                                }
                            }
                            
                            if let p4 = p4 {
                                Button {
                                    scrollAnchor.send(4)
                                } label: {
                                    Text(p4.title)
                                }
                                .id(4)
                                .padding(.horizontal, 5)
                                .getWidth { width in
                                    horizantalBarItemWidth[4] = width
                                }
                            }
                        }
                        .fixedSize(horizontal: false, vertical: false)
                        ZStack {
                            HStack(spacing: 0) {
                                Rectangle()
                                    .cornerRadius(30)
                                    .foregroundColor(.pink)
                                    .frame(width: barWidth, height: 3.0)
                                    .offset(x: barOffset)
                                    .animation(.linear)
                                Spacer()
                            }
                        }
                    }
                }
                .onChange(of: currentItemNo) { newValue in
                    withAnimation {
                        value.scrollTo(newValue, anchor: .leading)
                    }
                }
            }
            
            ScrollViewReader { value in
                ScrollView {
                    LazyVStack(spacing: 0) {
                        p1.content
                            .id(1)
                            .background(
                                GeometryReader { geo in
                                    Color.clear.preference(
                                        key: ViewOffsetsKey.self,
                                        value: [1 : geo.frame(in: .named("scrollView")).origin.y]) }
                            )
                        
                        if let p2 = p2 {
                            p2.content
                                .id(2)
                                .background(
                                    GeometryReader { geo in
                                        Color.clear.preference(
                                            key: ViewOffsetsKey.self,
                                            value: [2 : geo.frame(in: .named("scrollView")).origin.y])
                                    }
                                )
                        }
                        
                        if let p3 = p3 {
                            p3.content
                                .id(3)
                                .background(
                                    GeometryReader { geo in
                                        Color.clear.preference(
                                            key: ViewOffsetsKey.self,
                                            value: [3 : geo.frame(in: .named("scrollView")).origin.y])
                                    }
                                )
                        }
                        
                        if let p4 = p4 {
                            p4.content
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

extension ScrollViewContainerBuilder where P3 == EmptyView{
    init(p1: ScrollViewContent<P1>, p2: ScrollViewContent<P2>?) {
        self.p1 = p1
        self.p2 = p2
        self.p3 = nil
    }
}

extension ScrollViewContainerBuilder where P4 == EmptyView {
    init(p1: ScrollViewContent<P1>, p2: ScrollViewContent<P2>?, p3: ScrollViewContent<P3>?) {
        self.p1 = p1
        self.p2 = p2
        self.p3 = p3
        self.p4 = nil
    }
}
