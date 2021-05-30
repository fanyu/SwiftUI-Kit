//
//  HapticGroup.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/27.
//

import SwiftUI

struct HapticGroup: View {
    var body: some View {
        Group {
            SectionView(header: "ImpactFeedback", footer: "Haptic feedback privides a tactile response.") {
                Group {
                    Button("heavy") {
                        playFeedbackHaptic(.heavy)
                    }
                    Button("light") {
                        playFeedbackHaptic(.light)
                    }
                    Button("medium") {
                        playFeedbackHaptic(.medium)
                    }
                    Button("rigid") {
                        playFeedbackHaptic(.rigid)
                    }
                    Button("soft") {
                        playFeedbackHaptic(.soft)
                    }
                }
            }
            
            SectionView(header: "UINotificationFeedback", footer: "UINotificationFeedbackGenerator") {
                Group {
                    Button(action: { playNotificationHaptic(.error) }) {
                        Text("error")
                    }
                    
                    Button(action: { playNotificationHaptic(.success) }) {
                        Text("success")
                    }
                    
                    Button(action: { playNotificationHaptic(.warning) }) {
                        Text("warning")
                    }
                }
            }
        }
    }
    
    func playFeedbackHaptic(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    func playNotificationHaptic(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
}

struct HapticGroup_Previews: PreviewProvider {
    static var previews: some View {
        HapticGroup()
    }
}
