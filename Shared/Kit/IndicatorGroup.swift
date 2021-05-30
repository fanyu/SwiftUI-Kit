//
//  IndicatorGroup.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/28.
//

import SwiftUI

struct IndicatorGroup: View {
    @State private var progress = 0.5
    
    var body: some View {
        Group {
            SectionView(header: "ProgressView", footer: "A view that shows the progress towards completion of a task.") {
                Group {
                    ProgressView()
                    ProgressView("title")
                    ProgressView(value: 0.4) {
                        Text("Value=0.4")
                    }
                    ProgressView(value: progress)
                    #if os(watchOS)
                    ProgressView(value: $progress)
                        .progressViewStyle(CircularProgressViewStyle())
                    #endif
                }
            }
            
            #if os(watchOS)
            SectionView(header: "Gauge", footer: "A view that shows a value within a range.") {
                Gauge(value: progress, label: { Label("Progress", systemImage: "clock") })
            }
            #endif
        }
    }
}

struct IndicatorGroup_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorGroup()
    }
}
