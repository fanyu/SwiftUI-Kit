//
//  AnimView.swift
//  Scrumdinger
//
//  Created by FanYu on 2021/1/17.
//

import SwiftUI

struct AnimView: View {
    var body: some View {
        AnimatedButton()
    }
}

struct AnimatedButton: View {
    @State private var selected: Bool = false
    var body: some View {
        Button(action: { selected.toggle() }, label: {
            RoundedRectangle(cornerRadius: 10)
                .fill(selected ? Color.green : Color.red)
                //.animation(nil)
                .frame(width: selected ? 100:50, height: 50)
                //.rotationEffect(Angle.degrees(selected ? 45 : 0))
        })
        .animation(.linear(duration: 2))
        .transition(.blur)
        .shake(times: 2)
    }
}

extension View {
    func shake(times: Int) -> some View {
        return modifier(Shake(times:CGFloat(times)))
    }
    func shake2(times: Int) -> some View {
        return modifier(ShakeEffect(times: CGFloat(times)))
    }
}
struct Shake: AnimatableModifier {
    let amplitude: CGFloat = 10
    var times: CGFloat = 0
    var animatableData: CGFloat {
        get { times }
        set { times = newValue }
    }
    
    func body(content: Content) -> some View {
        content.offset(x: sin(times * .pi * 2) * amplitude)
    }
}

struct ShakeEffect: GeometryEffect {
    let amplitude: CGFloat = 10
    var times: CGFloat = 0
    var animatableData: CGFloat {
        get { times }
        set { times = newValue }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(
                translationX: sin(times * .pi * 2) * amplitude,
                y: 0
            )
        )
    }
}

// custom transition

struct Blur: ViewModifier {
    var active: Bool
    func body(content: Content) -> some View {
        return content
            .blur(radius: active ? 50 : 0)
            .opacity(active ? 0 : 1)
    }
}

extension AnyTransition {
    static var blur: AnyTransition {
        .modifier(
            active: Blur(active: true),
            identity: Blur(active: false)
        )
    }
}


// bounce
struct Bounce: AnimatableModifier {
    var times: CGFloat = 0
    var animatableData: CGFloat {
        get { times }
        set { times = newValue }
    }
    func body(content: Content) -> some View {
        content
    }
}

// clooapsible stack
struct Collapsible<Element, Content: View>: View {
    var data:[Element]
    var expaned: Bool = false
    var spacing: CGFloat? = 8
    var alignment: VerticalAlignment = .center
    var collapsedWidth: CGFloat = 10
    var content: (Element) -> Content
    
    var body: some View {
        HStack(alignment: alignment, spacing: expaned ? spacing : 0) {
            ForEach(data.indices, content: { item(at: $0) })
        }
    }
    
    private func item(at index: Int) -> some View {
        let showExpaned = expaned || index == data.endIndex - 1
        return content(data[index])
            .frame(
                width: showExpaned ? nil : collapsedWidth,
                alignment: Alignment(horizontal: .leading, vertical: alignment)
            )
    }
}


struct AnimView_Previews: PreviewProvider {
    static var previews: some View {
        AnimView()
    }
}
