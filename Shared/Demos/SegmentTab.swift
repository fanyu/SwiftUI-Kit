//
//  SegmentTab.swift
//  Scrumdinger
//
//  Created by FanYu on 2021/1/16.
//

import SwiftUI

struct SegmentTabNew: View {
    
    @State private var selectedIndex = 0
    @Namespace private var indexNS
    
    var currentIndex: Int { selectedIndex }

    var tabTitles: [String] = []
    var defaultIndex: Int = 0
    
    var body: some View {
        HStack {
            ForEach(tabTitles, id: \.self) { tab in
                Button {
                    withAnimation {
                        selectedIndex = index(of: tab)
                    }
                } label: {
                    Text(tab)
                        .font(isSelected(of: tab) ? .title : .title2)
                        .fontWeight(isSelected(of: tab) ? .bold : .medium)
                        .foregroundColor(isSelected(of: tab) ? .accentColor : .gray)
                }
                .matchedGeometryEffect(id: index(of: tab), in: indexNS, isSource: true)
            }
        }
        .overlay(
            Rectangle()
                .fill(Color.red)
                .frame(height: 5, alignment: .bottom)
                .matchedGeometryEffect(id: selectedIndex, in: indexNS, isSource: false)
        )

    }
    
    private func index(of tab: String) -> Int {
        return tabTitles.firstIndex(where: { $0 == tab }) ?? defaultIndex
    }
    
    private func isSelected(of tab: String) -> Bool {
        return selectedIndex == index(of: tab)
    }

}


struct SegmentTab: View {
    
    @State private var selectedIndex = 0
    
    var currentIndex: Int { selectedIndex }

    var tabTitles: [String] = []
    var defaultIndex: Int = 0
    
    var body: some View {
        HStack {
            ForEach(tabTitles, id: \.self) { tab in
                Button {
                    selectedIndex = index(of: tab)
                } label: {
                    Text(tab)
                        .font(isSelected(of: tab) ? .title : .title2)
                        .fontWeight(isSelected(of: tab) ? .bold : .medium)
                        .foregroundColor(isSelected(of: tab) ? .accentColor : .gray)
                }
                // 这里是获取Button anchor并存储到 Preference 里面
                .anchorPreference(key: SegmentBoundsKey.self, value: .bounds, transform: { anchor in
                    isSelected(of: tab) ? anchor : nil
                })
            }
        }
        // 这里是获取选中 item anchor 从 Preference
        .overlayPreferenceValue(SegmentBoundsKey.self, { anchor in
            GeometryReader { proxy in
                Rectangle()
                    .fill(Color.red)
                    .frame(width: proxy[anchor!].width, height: 5)
                    .offset(x: proxy[anchor!].minX)
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height,
                        alignment: .bottomLeading
                    )
                    .animation(.default)
            }
        })
    }
    
    private func index(of tab: String) -> Int {
        return tabTitles.firstIndex(where: { $0 == tab }) ?? defaultIndex
    }
    
    private func isSelected(of tab: String) -> Bool {
        return selectedIndex == index(of: tab)
    }
}

struct SegmentBoundsKey: PreferenceKey {
    static var defaultValue: Anchor<CGRect>? = nil
    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = value ?? nextValue()
    }
}

struct SegmentTab_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SegmentTab(tabTitles: ["Bio", "Apple", "Google"])
                .padding(.bottom)
            
            SegmentTabNew(tabTitles: ["Bio", "Apple", "Google"])
        }
        
    }
}
