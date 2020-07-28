//
//  ButtonGroup.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/23.
//

import SwiftUI

struct ButtonGroup: View {
    
    @State private var showingAlert = false
    @State private var showingSheet = false
    @State private var showingActionSheet = false

    var body: some View {
        Group {
            SectionView(header: "Alert", footer: "A control that performs an action when triggered.") {
                Group {
                    Button(action: {
                        showingAlert = true
                    }, label: {
                        Text("Show Alert")
                    })
                    .alert(isPresented: $showingAlert, content: {
                        Alert(title: Text("Title"),
                              message: Text("Message"),
                              primaryButton: .default(Text("Confirm")),
                              secondaryButton: .cancel()
                        )
                    })
                    
                    Button(action: {
                        showingSheet = true
                    }, label: {
                        Text("Show Sheet")
                    })
                    .sheet(isPresented: $showingSheet, content: {
                        Text("Sheet").padding()
                        #if os(macOS)
                        Button("Close") {
                            showingSheet.toggle()
                        }.padding()
                        #endif
                    })
                    
                    #if !os(macOS)
                    Button(action: {
                        showingActionSheet = true
                    }, label: {
                        Text("Show Action Sheet")
                            
                    })
                    .actionSheet(isPresented: $showingActionSheet, content: {
                        ActionSheet(title: Text("title"), message: Text("message"), buttons: [
                            .destructive(Text("destructive")),
                            .default(Text("default")),
                            .default(Text("default action"), action: {
                                print("default")
                            }),
                            .cancel()
                        ])
                    })
                    #endif
                }
            }
            
            #if !os(watchOS) && !os(tvOS)
            SectionView(header: "Link", footer: "A control for navigating to a URL") {
                Link("Apple", destination: URL(string: "https://www.apple.com")!)
            }
            #endif
            
            #if !os(watchOS)
            SectionView(header: "Menu", footer: "a control for presenting a contextually-appropriate menu of button") {
                Group {
                    #if os(macOS)
                    Menu("Show Menu") {
                        Button("Button1") {}
                        Button("Button2") {}
                        Menu("Submenu") {
                            Button("Button1") {}
                            Button("Button2") {}
                            Button("Button3") {}
                        }
                        Divider()
                        Button("Button3") {}
                        Button("Button4") {}
                        Menu("Submenu") {
                            Button("Button1") {}
                            Button("Button2") {}
                            Button("Button3") {}
                        }
                    }
                    #endif
                    
                    HStack {
                        #if os(iOS)
                        Text("Show Menu")
                        Spacer()
                        Text("Press & Hold")
                            .italic()
                            .foregroundColor(.secondary)
                        #elseif os(tvOS)
                        Button("Press & Hold") {}
                        #elseif os(macOS)
                        Text("Right click")
                        #endif
                    }
                    .contextMenu {
                        Button("Button1") {}
                        Button("Button2") {}
                        Divider()
                        Button("Button3") {}
                        Button("Button4") {}
                    }
                }
            }
            #endif
            
            SectionView(header: "NavigationLink", footer: "A view that controls a navigation presentation") {
                NavigationLink(destination: Text("Destionation")) {
                    Text("Next Label")
                }
            }
            
            #if os(iOS) || os(OSX)
            SectionView(header: "SignInWithApple", footer: "A control that you add to your interface to allow users to sign in") {
                SignInWithAppleButton(.signIn) { request in
                    request.requestedScopes = [.fullName, .email]
                } onCompletion: { result in
                    
                }
            }
            #endif
        }
    }
}

struct ButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGroup()
            .previewLayout(.sizeThatFits)
    }
}
