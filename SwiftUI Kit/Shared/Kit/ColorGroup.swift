//
//  ColorGroup.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/27.
//

import SwiftUI

struct StandardColor {
    var id = UUID()
    var name: String
    var color: Color
}

struct ColorGroup: View {
    var colors = [
        StandardColor(name: "accentColor", color: .accentColor),
        StandardColor(name: "black", color: .black),
        StandardColor(name: "blue", color: .blue),
        StandardColor(name: "clear", color: .clear),
        StandardColor(name: "gray", color: .gray),
        StandardColor(name: "green", color: .green),
        StandardColor(name: "orange", color: .orange),
        StandardColor(name: "pink", color: .pink),
        StandardColor(name: "primary", color: .primary),
        StandardColor(name: "purple", color: .purple),
        StandardColor(name: "red", color: .red),
        StandardColor(name: "secondary", color: .secondary),
        StandardColor(name: "white", color: .white),
        StandardColor(name: "yellow", color: .yellow),
    ]
    var body: some View {
        Group {
            ForEach(colors, id: \.id) { color in
                ColorItem(color: color)
            }
        }
    }
}

struct ColorItem: View {
    var color: StandardColor
    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(color.color)
                .frame(width: 24, height: 24)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color("StrockColor"), lineWidth: 1)
                )
            
            Text(color.name)
            Spacer()
        }
    }
}

struct ColorGroup_Previews: PreviewProvider {
    static var previews: some View {
        ColorGroup()
    }
}
