//
//  ToolBarGroup.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/28.
//

import SwiftUI

struct ToolBarGroup: View {
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                //.navigationTitle("ToolBar")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Button {
                                
                            } label: {
                                Text("BottomBar")
                            }
                            
                            Button {
                                
                            } label: {
                                Text("BottomBar2")
                            }
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            
                        } label: {
                            Text("BottomBar3")
                        }
                    }
                    
                    ToolbarItem(placement: .status) {
                        Button {} label: {
                            Text("status")
                        }
                    }
                    
          
                    ToolbarItem(placement: .navigation) {
                        Button {
                            
                        } label: {
                            Text("navigation")
                        }
                    }
                }
        }
    }
}

struct ToolBarGroup_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarGroup()
    }
}
