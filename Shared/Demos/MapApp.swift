//
//  Map.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/28.
//

import SwiftUI
import MapKit

struct MapApp: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        NavigationView {
            SideMenu()
            Map(coordinateRegion: $region)
        }
        .navigationTitle("New York, NY")
        .toolbar {
            ToolbarItem(placement:.navigation) {
                Button(action: { }) {
                    Image(systemName: "sidebar.left")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "location")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "map")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "view.3d")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "binoculars")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "arrowshape.turn.up.right.circle")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "plus")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
    }
}

struct SideMenu: View {
    
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            TextField("Placeholder", text: $searchText)
                .padding()
            
            List {
                Text("Favorite")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                
                VStack(alignment: .leading, spacing: 0) {
                    Label(title: { Text("Label") }, icon: { Image(systemName: "42.circle") } )
                    Label(title: { Text("Label") }, icon: { Image(systemName: "42.circle") } )
                    Label(title: { Text("Label") }, icon: { Image(systemName: "42.circle") } )
                }
                .padding(.bottom)
            }
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 192, idealWidth: 192, maxWidth: 192, maxHeight: .infinity)
    }
}

struct MapApp_Previews: PreviewProvider {
    static var previews: some View {
        MapApp()
    }
}
