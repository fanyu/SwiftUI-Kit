//
//  SunSet.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/28.
//

import SwiftUI

struct SunSet: View {
    
    @State private var backgroundColor = Color.blue
    @State private var sunSetted = false
    @State private var alignment = Alignment.top
    
    let sunGradient = [Color.yellow, Color.orange]
    let moonGradient = [Color.gray, Color.black];
    
    var body: some View {
        ZStack(alignment: alignment) {
            ZStack {
                Sun(gradient: sunGradient)
                Sun(gradient: moonGradient)
                    .opacity(sunSetted ? 1 : 0)
            }
            
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    Blur(style: .systemUltraThinMaterial)
                        .frame(height: geometry.size.height/2)
                }
            }
        }
        .background(backgroundColor)
        .cornerRadius(24)
        .onAppear {
            withAnimation(Animation.linear(duration: 12).repeatForever(autoreverses: true)) {
                sunset()
            }
        }
    }
    
    func sunset() {
        backgroundColor = .black
        sunSetted = true
        alignment = .bottom
    }
}

struct Sun: View {
    var gradient: [Color]
    
    var body: some View {
        Circle()
            .fill(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
            .padding()
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}


struct SunSet_Previews: PreviewProvider {
    static var previews: some View {
        SunSet()
    }
}
