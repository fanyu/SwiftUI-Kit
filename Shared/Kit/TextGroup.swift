//
//  TextGroup.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/27.
//

import SwiftUI

struct TextGroup: View {
    
    @State private var text = ""
    @State private var password = ""
    @State private var textEditor = ""

    var body: some View {
        Group {
            SectionView(header: "Text", footer: "A view that displays one or more lines of read-only text.") {
                Group {
                    Text("Text this is ")
                }
            }
            
            SectionView(header: "Placeholder", footer: "text placeholder and image placeholder") {
                VStack {
                    Text("This is placeholder")
                    Text("This is placeholder")
                        .redacted(reason: .placeholder)
                    Text("This is")
                        .redacted(reason: .placeholder)
                }
            }
            
            SectionView(header: "TextField", footer: "A control that displays an editable text interface.") {
                TextField("Placeholder", text: $text)
            }
            
            SectionView(header: "SecureField", footer: "A control into which the user securely enters private text.") {
                SecureField("Password", text: $password)
            }
            
            SectionView(header: "TextEditor", footer: "A view that can display and edit long-form text.") {
                TextEditor(text: $textEditor)
                    .frame(height:88)
            }
        }
    }
}

struct TextGroup_Previews: PreviewProvider {
    static var previews: some View {
        TextGroup()
    }
}
