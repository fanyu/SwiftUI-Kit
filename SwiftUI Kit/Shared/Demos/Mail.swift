//
//  Mail.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/29.
//

import SwiftUI

struct Mail: View {
    var body: some View {
        NavigationView {
            MailSideMenuView()
            Text("Select an email")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct MailSideMenuView: View {
    @State private var selection: Set<Int> = [0]
    
    var body: some View {
        List(selection: $selection) {
            NavigationLink(destination: MailInboxView()) {
                Label("Inbox", systemImage: "tray")
            }.tag(0)
            Label("Send", systemImage: "paperplane")
            Label("Trash", systemImage: "trash")
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth:100, idealWidth: 150, maxWidth: 200, maxHeight: .infinity)
    }
}

struct MailInboxView: View {
    var body: some View {
        NavigationView {
            List {
                MailInboxRow(title: "Jordan Singer", subtitle: "Hello, World!")
                MailInboxRow(title: "Jordan Singer", subtitle: "Hello, World!")
                MailInboxRow(title: "Jordan Singer", subtitle: "Hello, World!")
            }
            .listStyle(InsetListStyle())
            
            Text("Select an email")
                .frame(maxWidth:.infinity, maxHeight: .infinity)
        }
        .navigationTitle("Inbox")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
            
            ToolbarItem(placement: .principal) {
                Button(action: {}) {
                    Image(systemName: "arrowshape.turn.up.left")
                }
            }
            
            ToolbarItem(placement: .principal) {
                Button(action: {}) {
                    Image(systemName: "trash")
                }
            }
        }
    }
}

struct MailInboxRow: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        NavigationLink(destination: MailMessageView()) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.body)
            }
            .padding(.vertical, 10)
        }
    }
}

struct MailMessageView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Here’s to the crazy ones, the misfits, the rebels, the troublemakers, the round pegs in the square holes… the ones who see things differently — they’re not fond of rules… You can quote them, disagree with them, glorify or vilify them, but the only thing you can’t do is ignore them because they change things… they push the human race forward, and while some may see them as the crazy ones, we see genius, because the ones who are crazy enough to think that they can change the world, are the ones who do.")
                Spacer()
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct Mail_Previews: PreviewProvider {
    static var previews: some View {
        Mail()
    }
}
