//
//  ControlGroup.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/27.
//

import SwiftUI

struct ControlGroup: View {
    
    @State private var vibrateOnRing = true
    @State private var fruit = Fruit.apple
    @State private var birthday = Date()
    @State private var alarm = Date()
    @State private var volume = 50.0
    @State private var rating = 5.0
    @State private var age = 1
    @State private var color = Color.red
    
    var body: some View {
        Group {
            SectionView(header: "Toggle", footer: "A control that toggles between on and off states. The default style is a switch on iOS, and a checkbox on macOS") {
                Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
            }
            
            SectionView(header: "Picker", footer: "A control for selecting from a set of mutually exclusive values.") {
                Group {
                    Picker("Fruit", selection: $fruit) {
                        ForEach(Fruit.allCases) { Text($0.description).tag($0) }
                    }
                    
                    #if os(iOS)
                    Picker("Fruit", selection: $fruit) {
                        ForEach(Fruit.allCases) { Text($0.description).tag($0) }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Picker("Fruit", selection: $fruit) {
                        ForEach(Fruit.allCases) { Text($0.description).tag($0) }
                    }
                    .pickerStyle(WheelPickerStyle())
                    #endif
                    
                    #if os(macOS)
                    Picker("Fruit", selection: $fruit) {
                        ForEach(Fruit.allCases) { Text($0.description).tag($0) }
                    }
                    .pickerStyle(RadioGroupPickerStyle())
                    #endif
                }
            }
            
            #if os(iOS) || os(watchOS)
            SectionView(header: "DatePicker", footer: "A control for selecting an absolute date/time.") {
                Group {
                    DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date) {
                        Text("Birthday")
                    }
                    DatePicker("Alarm", selection: $alarm, displayedComponents: .hourAndMinute)
                }
            }
            #endif
            
            #if !os(tvOS)
            SectionView(header: "Slider", footer: "A control for selecting a value from a bounded linear range of values. It can slide continuously, or snap to fixed increments.") {
                Group {
                    Slider(value: $volume, in: 0...100, minimumValueLabel: Text("0%"), maximumValueLabel: Text("100%")) {
                        Text("Volume")
                    }
                    Slider(value: $rating, in: 1...10, step: 1, minimumValueLabel: Text("0"), maximumValueLabel: Text("10")) {
                        Text("Rating")
                    }
                }
            }
            #endif
            
            #if os(iOS) || os(OSX)
            SectionView(header: "Stepper", footer: "A control used to perform semantic increment and decrement actions.") {
                Stepper("Age:\(age)", value: $age, in: 0...100)
            }
            #endif
            
            #if os(iOS) || os(OSX)
            SectionView(header: "ColorPicker", footer: "A control used to select a color from the system color picker UI.") {
                ColorPicker("Color", selection: $color)
            }
            #endif
        }
    }
}

enum Fruit: String, CaseIterable, Identifiable, CustomStringConvertible {
    case apple
    case bananer
    case orange
    
    var id: String { self.rawValue }
    var description: String { self.rawValue.localizedCapitalized }
}

struct ControlGroup_Previews: PreviewProvider {
    static var previews: some View {
        ControlGroup()
    }
}
