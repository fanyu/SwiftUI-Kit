//
//  Setting.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/29.
//

import SwiftUI

struct Setting: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                User(name: "FanYu")
                Spacer()
                SettingItem(title: "FanYu", icon: "person.3.fill")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            
            Divider()
            
            VStack(spacing: 16) {
                HStack(alignment: .top) {
                    Spacer()
                    Group {
                        SettingItem(title: "General", icon: "menubar.dock.rectangle", color: .green)
                        Spacer()
                        SettingItem(title: "Desktop & Screen Saver", icon: "desktopcomputer", color: .blue)
                        Spacer()
                        SettingItem(title: "Dock & Menu Bar", icon: "dock.rectangle")
                        Spacer()
                        SettingItem(title: "Mission Control", icon: "macwindow.on.rectangle", color: .purple)
                    }
                    Spacer()
                }
                
                HStack(alignment: .top) {
                    Spacer()
                    Group {
                        SettingItem(title: "Touch ID", icon: "touchid", color: .pink)
                        Spacer()
                        SettingItem(title: "Users & Groups", icon: "person.2.fill")
                        Spacer()
                        SettingItem(title: "Wallet", icon: "creditcard", color: .orange)
                        Spacer()
                        SettingItem(title: "Notifs", icon: "bell.fill", color: .pink)
                    }
                    Spacer()
                }
            }
            .padding(.vertical, 24)
            .background(Color.white)
        }
    }
}

struct User: View {
    let name: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size:64))
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(name).font(.title2)
                Text("Apple ID, iCloud, Media & App Store").font(.subheadline)
            }
        }
    }
}

struct SettingItem: View {
    
    let title: String
    let icon: String
    var color: Color = .gray
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 32))
                .foregroundColor(color)
            
            Text(title)
                .font(.system(.callout))
                .foregroundColor(color)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
        }
        .frame(width:64)
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting()
    }
}
