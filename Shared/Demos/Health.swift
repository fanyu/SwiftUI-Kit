//
//  Health.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/28.
//

import SwiftUI

struct Health: View {
    var body: some View {
        NavigationView {
            List {
                Label("Summary", systemImage: "heart.fill")
                Label("Favorites", systemImage: "star.fill")
                Label("Highlights", systemImage: "sparkles")
                
                Divider()
                
                Label("Activity", systemImage: "flame.fill").accentColor(.orange)
                Label("Body", systemImage: "figure.walk").accentColor(.purple)
                Label("Hearing", systemImage: "ear.fill").accentColor(.blue)
                Label("Heart", systemImage: "heart.fill").accentColor(.red)
                Label("Respiratory", systemImage: "lungs.fill").accentColor(Color.orange)
                Label("Sleep", systemImage: "bed.double.fill").accentColor(.green)
            }
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth:180, idealWidth: 180, maxWidth: 180, maxHeight: .infinity)
        
        ActivityView()
    }
}

struct ActivityView: View {
    var body: some View {
        ScrollView {
            VStack {
                Module(title: "Steps", value: "5,972", subtitle: "steps")
                Module(title: "Walking + Running Distance", value: "2.8", subtitle: "mi")
                Module(title: "Active Energy", value: "251", subtitle: "cal")
                Module(title: "Resting Energy", value: "1,326", subtitle: "cal")
                Module(title: "Stand Minutes", value: "48", subtitle: "min")
                Module(title: "Exercise Minutes", value: "88", subtitle: "min")
                Module(title: "Stand Hours", value: "6", subtitle: "hr")
            }
            .padding()
        }
        .frame(width: 420)
        .navigationTitle("Activity")
        .toolbar {
            ToolbarItem(placement: .status) {
                
            }
        }
    }
}

struct Module: View {
    let title: String
    let value: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Label(title, systemImage: "flame.fill")
                    .foregroundColor(Color.pink)
                Spacer()
                Group {
                    Text("5:24PM")
                    Image(systemName: "chevron.right")
                }
            }
            
            HStack {
                Text(value)
                    .font(.system(.title, design:.rounded))
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.headline)
                    .foregroundColor(.secondary)
                Spacer()
            }
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(12)
        .padding()
    }
}

struct Health_Previews: PreviewProvider {
    static var previews: some View {
        Health()
    }
}
