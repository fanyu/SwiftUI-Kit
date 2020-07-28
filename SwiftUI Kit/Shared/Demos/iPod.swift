//
//  iPod.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/28.
//

import SwiftUI

struct iPod: View {
    var body: some View {
        VStack(spacing: 40) {
            StatusBar()
            Menu()
            Spacer()
        }
        .padding(.top, 24)
        .frame(width: 368, height: 540)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(32)
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.15)), radius: 24, x: 0, y: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 32)
                .stroke(Color.clear, lineWidth: 8)
                .shadow(color: Color(UIColor.black.withAlphaComponent(0.3)), radius: 12, x: 0, y: 0)
                .clipShape(
                    RoundedRectangle(cornerRadius: 32)
                )
        )
    }
}

struct StatusBar: View {
    var body: some View {
        HStack {
            Text("iPod")
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "play.fill")
                .foregroundColor(.blue)
            Image(systemName: "battery.100")
                .foregroundColor(.green)
        }
        .font(.caption)
        .padding(.vertical, 4)
        .padding(.horizontal, 6)
        .foregroundColor(.secondary)
        .background(Color(UIColor.secondarySystemBackground))
    }
}

struct Menu: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Music")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 6)
                .foregroundColor(.white)
                .background(Color.blue)
                .padding(-6)
                .padding(.bottom, 6)
                
                Text("Videos")
                Text("Photos")
                Text("Podcasts")
                Text("Extras")
                Text("Settings")
                Text("Shuffle Songs")
                Spacer()
            }
            .padding(6)
            .foregroundColor(.black)
            .font(.headline)
        }
        .background(Color.white)
    }
}

struct CircleWheel: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(height: 192)
                .shadow(color: Color(UIColor.black.withAlphaComponent(0.05)), radius: 4, x: 0, y: 0)
                .overlay(
                    Circle()
                        .fill(Color(UIColor.secondarySystemBackground))
                        .frame(width: 80, height: 80)
                        .overlay(
                            // 外边框
                            Circle()
                                .stroke(Color(UIColor.black.withAlphaComponent(0.1)), lineWidth: 0.5)
                        )
                        .overlay(
                            // 内圆
                            Circle()
                                .stroke(Color.clear, lineWidth: 2)
                                .shadow(color: Color(UIColor.black.withAlphaComponent(0.05)), radius: 2, x: 0, y: 1)
                                .clipShape(
                                    Circle()
                                )
                        )
                )
            
            VStack(spacing: 0) {
                Text("Menu")
                    .fontWeight(.semibold)
                Spacer()
                HStack {
                    Image(systemName: "backward.end.alt.fill")
                    Spacer()
                    Image(systemName: "forward.end.alt.fill")
                }
                Spacer()
                Image(systemName: "playpause.fill")
            }
            .padding()
            .frame(width: 192, height: 192)
            .foregroundColor(Color(UIColor.tertiaryLabel))
            .font(.footnote)
        }
    }
}

struct iPod_Previews: PreviewProvider {
    static var previews: some View {
        iPod()
    }
}
