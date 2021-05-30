//
//  Message.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/29.
//

import SwiftUI

struct Message: View {
    var body: some View {
        VStack {
            MessageBubble(message: MessageModel(isSelf: true, content: "my self", name: "d", avatar: ""))

            MessageBubble(message: MessageModel(isSelf: false, content: "not my self", name: "d", avatar: ""))
            
            MessageBubble(message: MessageModel(isSelf: true, content: "my self asldfjkaksjfask jklsdafkljkdsajasdfasdfasdfasdfasdfasdfadsffdlk ", name: "d", avatar: ""))
        }
    }
}

struct MessageModel {
    var isSelf: Bool
    var content: String
    var name: String
    var avatar: String
}

struct MessageBubble: View {
    let message: MessageModel
    
    var body: some View {
        HStack {
            if message.isSelf {
                Spacer()
            }
            
            Text(message.content)
                .foregroundColor(message.isSelf ? Color.white : Color.black)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(message.isSelf ? Color.blue : Color.yellow)
                .cornerRadius(16)
                
            if !message.isSelf {
                Spacer()
            }
        }
        .padding()
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message()
    }
}
