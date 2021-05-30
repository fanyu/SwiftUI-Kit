//
//  MatchedGeometryView.swift
//  Scrumdinger
//
//  Created by FanYu on 2021/1/16.
//

import SwiftUI

struct MatchedGeometryView: View {
    
    @State private var state = false
    @Namespace private var ns
    
    var body: some View {
        VStack {
            HStack {
                if state {
                    Rectangle()
                        .fill(Color.blue)
                        .matchedGeometryEffect(id: 1, in: ns)
                        .frame(width: 200, height: 200)
                }
                Spacer()
                if !state {
                    Circle()
                        .fill(Color.blue)
                        .matchedGeometryEffect(id: 1, in: ns)
                        .frame(width: 100, height: 100)
                }
            }
            .border(Color.black)
            .frame(width: 300, height: 200)
            
            Toggle("", isOn: $state)
        }
        .animation(.default)
    }
}

struct NoOpTransition: AnimatableModifier {
    var animatableData: CGFloat = 0
    
    init(_ x: CGFloat) {
        animatableData = x
    }
    
    func body(content: Content) -> some View {
        return content
    }
}

extension AnyTransition {
    static let noOp: AnyTransition = .modifier(active: NoOpTransition(1), identity: NoOpTransition(0))
}

struct MatchedGeometryView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryView()
    }
}
