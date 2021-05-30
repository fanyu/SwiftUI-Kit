//
//  EnvView.swift
//  Scrumdinger
//
//  Created by FanYu on 2021/1/15.
//

import SwiftUI

struct EnvView: View {
    @Environment(\.knobPointSize) var envPointSize
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: envPointSize)
    }
}

extension View {
    func pointSize(_ size: CGFloat) -> some View {
        environment(\.knobPointSize, size)
    }
}

fileprivate struct PointerSizeKey: EnvironmentKey {
    static let defaultValue: CGFloat = 0.1
}

extension EnvironmentValues {
    var knobPointSize: CGFloat {
        get { self[PointerSizeKey.self] }
        set { self[PointerSizeKey.self] = newValue }
    }
}

struct EnvView_Previews: PreviewProvider {
    static var previews: some View {
        EnvView()
    }
}

/// badge

extension View {
    func badge(count: Int) -> some View {
        overlay(
            ZStack {
                if count != 0 {
                    //Circle
                }
            }
            .offset(x: 12, y: -12)
            .frame(width: 30, height: 30)
        , alignment: .topTrailing)
    }
}




