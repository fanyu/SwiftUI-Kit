//
//  StackView.swift
//  Scrumdinger
//
//  Created by FanYu on 2021/1/16.
//

import SwiftUI

struct ContentView: View {
    let colors: [(Color, CGFloat)] = [(.red, 50), (.green, 30), (.blue, 75)]
    
    @State var horizontal: Bool = true
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation(.default) {
                    horizontal.toggle()
                }
            }) { Text("Toggle axis") }
            
            Stack(elements: colors, axis: horizontal ? .horizontal : .vertical) { item in
                Rectangle()
                    .fill(item.0)
                    .frame(width: item.1, height: item.1)
            }
            .border(Color.black)
        }
    }
}
    
struct Stack<Element, Content: View>: View {
    var elements: [Element]
    var spacing: CGFloat = 8
    var axis: Axis = .horizontal
    var alignment: Alignment = .topLeading
    var content: (Element) -> Content
    
    @State private var offsets:[CGPoint] = []
    
    var body: some View {
        ZStack(alignment: alignment) {
            ForEach(elements.indices, content: { idx in
                content(elements[idx])
                    .modifier(CollectSize(index: idx))
                    .alignmentGuide(alignment.horizontal, computeValue: {
                        axis == .horizontal
                            ? -offset(at: idx).x
                            : $0[alignment.horizontal]
                    })
                    .alignmentGuide(alignment.vertical, computeValue: {
                        axis == .vertical
                            ? -offset(at: idx).y
                            : $0[alignment.vertical]
                    })
            })
        }
        .onPreferenceChange(CollectSizeKey.self, perform: computeOffsets)
    }
    
    private func computeOffsets(sizes: [Int: CGSize]) {
        guard !sizes.isEmpty else { return }
        
        var offsets: [CGPoint] = [.zero]
        for idx in 0..<elements.count {
            guard let size = sizes[idx] else { fatalError() }
            var newPoint = offsets.last!
            newPoint.x += size.width + self.spacing
            newPoint.y += size.height + self.spacing
            offsets.append(newPoint)
        }
        self.offsets = offsets
    }
    
    private func offset(at index: Int) -> CGPoint {
        guard index < offsets.endIndex else { return .zero }
        return offsets[index]
    }
}

// 存储到 Preference
struct CollectSize: ViewModifier {    
    var index: Int
    func body(content: Self.Content) -> some View {
        content.background(
            GeometryReader(content: { geometry in
                Color.clear.preference(
                    key: CollectSizeKey.self,
                    value: [index: geometry.size]
                )
            })
        )
    }
}

struct CollectSizeKey: PreferenceKey {
    static var defaultValue: [Int: CGSize] = [:]
    static func reduce(value: inout [Int : CGSize], nextValue: () -> [Int : CGSize]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

